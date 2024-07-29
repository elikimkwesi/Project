import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class OrangeCitrus extends StatefulWidget {
  OrangeCitrus({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  OrangeCitrusState createState() => OrangeCitrusState();
}

class OrangeCitrusState extends State<OrangeCitrus> {
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
            Navigator.pop(context);
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
                      tag: "Orange Citrus Greening",
                      child: AnotherCarousel(
                        images: [
                          AssetImage('assets/orange.jpg'),
                          AssetImage('assets/orange2.jpg'),
                          AssetImage('assets/orange3.jpg'),
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
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Orange Citrus Greening',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Haunglongbing',
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
                      '1. Symptoms of citrus greening often appear on the leaves of orange trees with yellow spotting and veins. Unlike the yellowing that can result from a lack of nutrients, citrus greening-affected leaves have irregular splotches and the fruit can become misshapen and bitter.\n\n2. For an effective diagnosis, horticulturalists are brought into groves to identify the disease. A tree affected by HLB may exhibit yellow shoots and or deficiency symptoms that are on one or many branches randomly arranged in the canopy.\n\n3. The fruit symptoms with major economic impact are the reduction in fruit size, premature fruit drop, low content of soluble acids in the juice and a bitter or salty taste of the juice.\n\n4. Trees with a prolonged infection appear stunted when compared to healthy trees.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'In citrus there are three forms of concern, the Asian, African and American forms. The Asian form of HLB expresses symptoms in both cool and warm conditions. The African form of HLB expresses symptoms only in cool conditions (20-250 C, 68-770 F). HLB can be acquired by both nymphs and adults, which can maintain and transmit the disease throughout their 3- to 4-month lifespan.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      'Begin with clean plant material. Make application of foliar insecticide spray prior to tree removal. Increase frequency of scouting in areas where infected trees have been removed.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      'Use soil-applied systemic insecticides on young trees. Foliar insecticide sprays will provide control on both young and mature trees.',
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
