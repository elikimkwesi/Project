import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import '/screens/classified_diseases_screen.dart';  // Import the ClassifiedDiseases screen

class TomatoMosaic extends StatefulWidget {
  TomatoMosaic({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  TomatoMosaicState createState() => TomatoMosaicState();
}

class TomatoMosaicState extends State<TomatoMosaic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClassifiedDiseases()),
            );
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: 300.0,
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: "Tomato Mosaic Virus",
                      child: AnotherCarousel(
                        images: [
                          AssetImage('assets/mosaic.jpg'),
                          AssetImage('assets/mosaic2.jpg'),
                          AssetImage('assets/mosaic3.jpg'),
                        ],
                        dotSize: 4.0,
                        dotSpacing: 15.0,
                        autoplay: true,
                        dotColor: Colors.white,
                        indicatorBgPadding: 50.0,
                        dotBgColor: Colors.transparent,
                        borderRadius: false,
                        moveIndicatorFromBottom: 200.0,
                        noRadiusForIndicator: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 270, left: 20, right: 20),
                child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width - 24.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tomato Mosaic Virus',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Tobamovirus',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: 'SYMPTOMS'),
                SectionContent(
                  content:
                      '1. Tomato mosaic virus is a serious and extremely contagious disease. It is also hard to identify, with symptoms varying wildly depending upon the variety and age of the infected plant, the strain of the virus, and environmental conditions.\n\n2. Tomato mosaic virus symptoms can be found at any stage of growth and all parts of the plant may be infected.\n\n3. They are often seen as a general mottling or mosaic appearance on foliage. When the plant is severely affected, leaves may look akin to ferns with raised dark green regions.\n\n4. Leaves may also become stunted. Infected plants may have a severe reduction in fruit set and those that do set may be dotted with yellow blotches and necrotic spots while the interior of the fruit is brown.\n\n5. Stems, petioles, leaves and fruit may all show signs of infection.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'Symptoms may be suppressed during cool temperatures. As a result, infected seedlings may not display symptoms until moved to a warm environment. Tomato mosaic virus can exist for two years in dry soil or leaf debris, but will only persist one month if soil is moist. The viruses can also survive in infected root debris in the soil for up to two years. Seed can be infected and pass the virus to the plant but the disease is usually introduced and spread primarily through human activity. The virus can easily spread between plants on workers hands, tools, and clothes with normal activities such as plant tying, removing of suckers, and harvest.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1. Use certified disease free seeds. Purchase transplants only from reputable sources.\n\n2. Ask about the sanitation procedures they use to prevent disease. Inspect transplants prior to purchase.\n\n3. Choose only transplants showing no clear symptoms. Avoid planting in fields where tomato root debris is present, as the virus can survive long-term in roots.\n\n4. Wash hands with soap and water before and during the handling of plants to reduce potential spread between plants. Disinfect tools regularly — ideally between each plant, as plants can be infected before showing obvious symptoms.\n\n5. For added security against spread, keep separate tools for working in the diseased area and avoid working with healthy plants after working in an area with diseased plants.\n\n6. At the end of the season, burn all plants from diseased areas, even healthy-appearing ones, or bury them away from vegetable production areas.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      'There are currently no chemical options that are effective against either virus.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, bottom: 20),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;

  SectionContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        content,
        style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
