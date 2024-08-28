import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SensorDataPage extends StatefulWidget {
  final List<double> soilMoistureData;
  final List<double> waterLevelData;
  final List<double> temperatureData;
  final List<double> humidityData;

  SensorDataPage({
    required this.soilMoistureData,
    required this.waterLevelData,
    required this.temperatureData,
    required this.humidityData,
  });

  @override
  _SensorDataPageState createState() => _SensorDataPageState();
}

class _SensorDataPageState extends State<SensorDataPage> {
  String _selectedFilter = 'Day';
  String? _selectedSensor;

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
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white, // Ensure the graph page has a white background
                      child: LineChart(
                        _buildLineChart(
                          _filterData(_getSelectedSensorData()),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  List<double> _getSelectedSensorData() {
    switch (_selectedSensor) {
      case 'Soil Moisture':
        return widget.soilMoistureData;
      case 'Water Level':
        return widget.waterLevelData;
      case 'Temperature':
        return widget.temperatureData;
      case 'Humidity':
        return widget.humidityData;
      default:
        return [];
    }
  }

  LineChartData _buildLineChart(List<double> data) {
    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(show: true),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: data
              .asMap()
              .entries
              .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
              .toList(),
          isCurved: true,
          color: Colors.blue,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
        ),
      ],
    );
  }
}