import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WalkthroughScreen extends StatefulWidget {
  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  final int _totalPages = 3;
  int _currentPage = 0;

  final List<String> images = [
    'assets/henry-perks-aOTBPSDjgj0-unsplash.jpg',
    'assets/Maize seedling in cultivated agricultural field with graphic concepts modern agricultural technology, digital farm, smart farming innovation, IOT.jpeg',
    'assets/Potato-leaf-blight.webp'
  ];

  final List<String> titles = [
    'Real-Time Insights for Better Decisions',
    'Streamline Your Daily Operations',
    'Identify Crop Diseases'
  ];

  final List<String> descriptions = [
    'Get instant updates on crop health, soil conditions, and weather patterns.',
    'Simplify task management, scheduling, and resource allocation.',
    'Quickly diagnose crop diseases with our advanced detection tool.'
  ];

  @override
  void initState() {
    super.initState();
    _autoSlidePages();
  }

  void _autoSlidePages() {
    Future.delayed(const Duration(seconds: 10), () {
      if (_currentPage < _totalPages - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
      _autoSlidePages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _totalPages,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), // Reduced opacity and added color
                      BlendMode.darken,
                    ),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 3),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              titles[index],
                              textStyle: const TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          isRepeatingAnimation: false,
                        ),
                        const SizedBox(height: 20),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              descriptions[index],
                              textStyle: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                              speed: const Duration(milliseconds: 50),
                            ),
                          ],
                          isRepeatingAnimation: false,
                        ),
                        const Spacer(flex: 2),
                        ElevatedButton(
                          onPressed: () {
                            if (index == _totalPages - 1) {
                              Navigator.pushReplacementNamed(context, '/login');
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(index == _totalPages - 1 ? 'Get Started' : 'Next'),
                        ),
                        if (index < _totalPages - 1)
                          TextButton(
                            onPressed: () {
                              _pageController.jumpToPage(_totalPages - 1);
                            },
                            child: const Text('Skip', style: TextStyle(color: Colors.white)),
                          ),
                        const SizedBox(height: 20), // Add space below the buttons
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _totalPages,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: _currentPage == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
