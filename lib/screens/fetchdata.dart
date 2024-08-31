import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SensorDataPage extends StatefulWidget {
  @override
  _SensorDataPageState createState() => _SensorDataPageState();
}

class _SensorDataPageState extends State<SensorDataPage> {
  String _selectedFilter = 'Day';
  String? _selectedSensor;
  List<double> sensorData = [];

  Future<void> fetchSensorData(String period, String sensorType) async {
    try {
      final response = await http.get(
        Uri.parse('https://backend-sw02.onrender.com/api/averages/?period=$period'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //print(data['data']);

        if (data['status'] == 'SUCCESS') {
          print('Data received: $data'); // Debugging print statement
          setState(() {
            sensorData = _parseSensorData(sensorType, data['data']);
          });
        } else {
          throw Exception('API returned a failure status: ${data['status']}');
        }
      } else {
        throw Exception('Failed to load sensor data with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e'); // Debugging print statement
      throw Exception('Failed to load sensor data');
    }
  }

  List<double> _parseSensorData(String sensorType, List<dynamic> data) {
    if (data.isEmpty) return [];

    List<double> parsedData = [];
    for (var item in data) {
      switch (sensorType) {
        case 'Soil Moisture':
          parsedData.add((item['avgSoilMoisture']?.toDouble() ?? 0.0));
          break;
        case 'Water Level':
          parsedData.add((item['avgwaterLevel']?.toDouble() ?? 0.0));
          print(item['avgwaterLevel']);
          break;
        case 'Temperature':
          parsedData.add((item['avgTemperature']?.toDouble() ?? 0.0));
          break;
        case 'Humidity':
          parsedData.add((item['avgHumidity']?.toDouble() ?? 0.0));
          break;
        default:
          break;
      }
    }
    print('Parsed data: $parsedData');
    return parsedData;
  }

  List<double> _filterData(List<double> data) {
    switch (_selectedFilter) {
      case 'Week':
        return data.take(7).toList(); // Example: first 7 points for a week
      case 'Month':
        return data.take(30).toList(); // Example: first 30 points for a month
      default: // 'Day'
        return data.take(24).toList(); // Example: first 24 points for a day
    }
  }

  Widget _buildSensorButton(String sensorName) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedSensor = sensorName;
          });
          fetchSensorData(
            _selectedFilter.toLowerCase(),
            sensorName, // Pass the sensorName directly
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          textStyle: TextStyle(fontSize: 24),
        ),
        child: Center(child: Text(sensorName)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor Readings'),
        leading: _selectedSensor != null
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _selectedSensor = null;
                  });
                },
              )
            : null,
      ),
      body: _selectedSensor == null
          ? Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images (1).jpg', // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.3), // Adjust the opacity as needed
                  ),
                ),
                ListView(
                  children: [
                    _buildSensorButton('Soil Moisture'),
                    _buildSensorButton('Water Level'),
                    _buildSensorButton('Temperature'),
                    _buildSensorButton('Humidity'),
                  ],
                ),
              ],
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_selectedSensor!, style: TextStyle(fontSize: 24)),
                      DropdownButton<String>(
                        value: _selectedFilter,
                        items: ['Day', 'Week', 'Month']
                            .map((filter) => DropdownMenuItem<String>(
                                  value: filter,
                                  child: Text(filter),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedFilter = value!;
                          });
                          fetchSensorData(
                            value?.toLowerCase() ?? '',
                            _selectedSensor!, // No transformation needed
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      color: Colors.white, // Ensure the graph page has a white background
                      child: LineChart(
                        _buildLineChart(
                          _filterData(sensorData),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

    LineChartData _buildLineChart(List<double> data) {
    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, interval: 5),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, interval: 5),
        ),
        topTitles:AxisTitles(
          sideTitles: SideTitles(showTitles: false, interval: 1),
        ),
        rightTitles:AxisTitles(
          sideTitles: SideTitles(showTitles: false, interval: 1),
        )
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: data
              .asMap()
              .entries
              .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
              .toList(),
          isCurved: true, // This makes the line curve smoother
          color: Colors.blue,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true), // Show dots on the line to represent each data point
        ),
      ],
      minX: 0,
      maxX: data.length.toDouble() - 1, // Adjust X-axis to fit the data length
      minY: data.reduce((a, b) => a < b ? a : b) - 1, // Min Y value - 1 for padding
      maxY: data.reduce((a, b) => a > b ? a : b) + 1, // Max Y value + 1 for padding
    );
  }
}