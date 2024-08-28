import 'package:flutter/material.dart';
import 'package:harvestify/screens/disease_prediction_screen.dart';
import 'package:harvestify/screens/fetchdata.dart';
import 'package:harvestify/widgets/avatarWidget.dart';
import 'package:harvestify/widgets/newsDetail.dart';
import 'package:harvestify/widgets/newsList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/profile.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String weatherDescription = '';
  String temperature = '';
  String highLowTemp = '';
  String airQuality = '';
  String humidity = '';
  List<dynamic> forecast = [];
  List<dynamic> news = [];
  String selectedCity = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print("HomeScreen initialized");
    fetchNews();
  }

  Future<void> fetchWeather(String city) async {
    const apiKey = 'd14288d4a4221432633a42c6379c5a63';
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final forecastUrl = 'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';

    try {
      final weatherResponse = await http.get(Uri.parse(url));
      final forecastResponse = await http.get(Uri.parse(forecastUrl));

      if (weatherResponse.statusCode == 200 && forecastResponse.statusCode == 200) {
        final weatherData = jsonDecode(weatherResponse.body);
        final forecastData = jsonDecode(forecastResponse.body);
        setState(() {
          weatherDescription = weatherData['weather'][0]['description'];
          temperature = '${weatherData['main']['temp']}°';
          highLowTemp = 'H: ${weatherData['main']['temp_max']}° L: ${weatherData['main']['temp_min']}°';
          airQuality = 'Good'; // Placeholder, replace with actual data if available
          humidity = '${weatherData['main']['humidity']}%';
          forecast = forecastData['list'].take(4).toList();
        });
        print("Weather data fetched successfully");
      } else {
        setState(() {
          weatherDescription = 'Failed to fetch weather';
        });
        print("Failed to fetch weather");
      }
    } catch (e) {
      setState(() {
        weatherDescription = 'Failed to fetch weather: $e';
      });
      print("Error fetching weather: $e");
    }
  }

  Future<void> fetchNews() async {
    const apiKey = '41a8de9edd224bc6b9817a342d2d1310';
    const url = 'https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          news = data['articles'].take(5).toList(); // Take only the first 5 news articles
        });
        print("News data fetched successfully");
      } else {
        setState(() {
          news = [];
        });
        print("Failed to fetch news");
      }
    } catch (e) {
      setState(() {
        news = [];
      });
      print("Error fetching news: $e");
    }
  }

  Future<void> _selectLocation(BuildContext context) async {
    final TextEditingController locationController = TextEditingController();
    String? city = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Location'),
          content: TextField(
            controller: locationController,
            decoration: const InputDecoration(hintText: 'Enter city name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(locationController.text);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (city != null && city.isNotEmpty) {
      setState(() {
        selectedCity = city;
      });
      fetchWeather(city);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Building HomeScreen widget");
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile and notification section
              Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen(username: '', surname: '', otherNames: '', primaryContact: '', secondaryContact: '',)),
                        );
                      },
                      child:  AvatarWidget(),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Welcome',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.black),
                      onPressed: () {
                        // Handle notifications tap
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.grid_view, color: Colors.black),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ],
                ),
              ),

              // Weather section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _selectLocation(context),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Colors.green),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Your Weather',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown, // Changed to brown for a natural look
                              ),
                            ),
                            const SizedBox(height: 8),
                            selectedCity.isEmpty
                                ? const Text(
                                    'Tap to select location',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        temperature,
                                        style: const TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 6, 80, 8), // Darker green for better contrast
                                        ),
                                      ),
                                      Text(
                                        highLowTemp,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 6, 80, 8), // Matching high/low temp color
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: forecast.map((f) {
                                          return Column(
                                            children: [
                                              const Icon(Icons.cloud, color: Colors.lightBlue), // Replace with actual weather icon
                                              Text(
                                                '${DateTime.fromMillisecondsSinceEpoch(f['dt'] * 1000).hour}:00',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 6, 80, 8),
                                                ),
                                              ),
                                              Text(
                                                '${f['main']['temp']}°',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 6, 80, 8),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                      const SizedBox(height: 10),
                                      const Divider(color: Colors.black),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Air Quality Index:',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            airQuality,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 6, 80, 8),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Humidity:',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            humidity,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 6, 80, 8),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      const Divider(color: Colors.black),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: forecast.map((f) {
                                          return Column(
                                            children: [
                                              Text(
                                                getDay(DateTime.fromMillisecondsSinceEpoch(f['dt'] * 1000)),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Icon(Icons.cloud, color: Colors.lightBlue), // Replace with actual weather icon
                                              Text(
                                                '${f['main']['temp_max']}°',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 6, 80, 8),
                                                ),
                                              ),
                                              Text(
                                                '${f['main']['temp_min']}°',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 6, 80, 8),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // What would you like to do section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: _buildFeatureCard(Icons.healing, 'Predict Diseases', Colors.red, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PredictionPage()),
                        );
                      }),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildFeatureCard(Icons.eco, 'Monitor Farm', Colors.green, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SensorDataPage(soilMoistureData: [], waterLevelData: [], temperatureData: [], humidityData: [],)),
                        );// Handle Monitor Farm tap
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Agricultural news section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Science News',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsListScreen(news: news)),
                        );
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: news.map((article) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsDetailScreen(article: article)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            children: [
                              article['urlToImage'] != null
                                  ? Image.network(
                                      article['urlToImage'],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.grey,
                                      child: const Icon(Icons.image, color: Colors.white),
                                    ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      article['title'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'by ${article['author'] ?? 'Unknown'}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${(article['content'] != null ? (article['content'] as String).split(' ').length ~/ 200 : 1)} min read',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDay(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
}
