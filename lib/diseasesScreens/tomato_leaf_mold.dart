// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import '/screens/classified_diseases_screen.dart';  // Make sure to import the ClassifiedDiseases screen

class TomatoLeafMold extends StatefulWidget {
  TomatoLeafMold({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  TomatoLeafMoldState createState() => TomatoLeafMoldState();
}

class TomatoLeafMoldState extends State<TomatoLeafMold> {
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
                      tag: "Tomato Leaf Mold",
                      child: AnotherCarousel(
                        images: [
                          AssetImage('assets/mold1.jpg'),
                          AssetImage('assets/mold2.jpeg'),
                          AssetImage('assets/mold3.jpg'),
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
                          'Tomato Leaf Mold',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Passalora Fulva',
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
                      '1. The oldest leaves are infected first. Pale greenish-yellow spots, usually less than 1/4 inch, with no definite margins, form on upper sides of leaves.\n\n2. Olive-green to brown velvety mold forms on the lower leaf surface below leaf spots. Lower side of tomato leaf with olive-green to brown velvety mold below leaf spots on upper side.\n\n3. Olive green to brown velvety sporulation on the lower leaf surface. Leaf spots grow together and turn brown.\n\n4. Leaves wither and die but often remain attached to the plant. Row of tomato plants, lower two thirds of plants have dead, brown leaves.\n\n5. Leaf death caused by severe leaf mold infection. Infected blossoms turn black and fall off.\n\n6. Fruit infections start as a smooth black irregular area on the stem end of the fruit. As the disease progresses, the infected area becomes sunken, dry and leathery.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'Optimal growth is at relative humidity greater than 85%. Optimal temperature is between 71 °F and 75 °F, but disease can occur at temperatures as low as 50 °F and as high as 90 °F. Relative humidity at or above 85 % will favor severe leaf mold epidemics. Some disease can occur at humidity less than 85 %. It can spread from leaf to leaf and plant to plant by wind, rain/overhead irrigation, tools, workers and perhaps insects. It can survive for 6 months to a year above ground at room temperature.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1. Use drip irrigation and avoid watering foliage.\n\n2. Space plants to provide good air movement between rows and individual plants. Stake, string or prune to increase airflow in and around the plant.\n\n3. Sterilize stakes, ties, trellises etc. with 10% household bleach or commercial sanitizer.\n\n4. Circulate air in greenhouses or tunnels with vents and fans and by rolling up high tunnel sides to reduce humidity around plants.\n\n5. Keep night temperatures in greenhouses higher than outside temperatures to avoid dew formation on the foliage. Remove crop residue at the end of the season.\n\n6. Burn it or bury it away from tomato production areas. Clean the high tunnel or greenhouse walls and benches at the end of the season with a commercial sanitizer.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      'Applications should be made prior to infection when environmental conditions favor disease to be the most effective. The first leaf mold infections of the season have been observed in the first week of June in Minnesota high tunnel tomatoes. Fungicide applications should be repeated according to label instructions. It is important to alternate between different chemical families to avoid the development of pathogen resistance to particular active ingredients.',
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
