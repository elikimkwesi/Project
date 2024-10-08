// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class TomatoEarlyBlight extends StatefulWidget {
  TomatoEarlyBlight({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TomatoEarlyBlightState createState() => _TomatoEarlyBlightState();
}

class _TomatoEarlyBlightState extends State<TomatoEarlyBlight> {
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
                      tag: "Tomato Early Blight",
                      child: AnotherCarousel(
                        images: [
                          AssetImage('assets/tlb.jpg'),
                          AssetImage('assets/tlb2.jpg'),
                          AssetImage('assets/tlb3.jpg'),
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
                          'Tomato Early Blight',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Alternaria Solani',
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
                      'Symptoms of early blight occur on older foliage, stem, and fruits. Gray to brown spots appear on leaves and gradually grow in a concentric manner around a clear center - the characteristic “bullseye” formation. These lesions are surrounded by a bright yellow halo. As the disease progresses, entire leaves may turn chlorotic and shed, leading to significant defoliation. When leaves die and fall, fruits become more vulnerable to sun scald. The same type of spots with a clear center appears on stems and fruits. Rotting of fruits and sometimes dropping follows.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'Warm temperatures (24-29°C) and high humidity (90%) favor development of the disease. A long wet period (or alternating wet/dry weather) enhances the production of spores, which may be spread via wind, splashing rain or overhead irrigation. Tubers harvested green or in wet conditions are particularly susceptible to an infection. It often strikes after a period of heavy rainfall and is particularly destructive in tropical and subtropical areas.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1. Look for varieties that are resistant to the disease.\n\n2. Plant or transplant on raised beds to improve drainage.\n\n3. Use certified pathogen-free seeds or transplants.\n\n4. Orient rows in the direction of main winds and avoid shaded areas.\n\n5. Space plants to allow the canopy to dry quickly after rainfall or irrigation.\n\n6. Lay mulch on the soil to keep plants from touching the soil.\n\n7. Monitor fields for signs of the disease, particularly during wet weather.\n\n8. Alternatively, plow debris deep in the soil (more than 45 cm).',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      '1. Application of products based on Bacillus subtilis or copper-based fungicides registered as organic can treat this disease.\n\n2. Always consider an integrated approach with preventive measures and biological treatments if available. There are numerous fungicides on the market for controlling early blight. Fungicides based on or combinations of azoxystrobin, pyraclostrobin, difenoconazole, boscalid, chlorothalonil, fenamidone, maneb, mancozeb, trifloxystrobin, and ziram can be used. Rotation of different chemical compounds is recommended. Apply treatments in a timely manner, taking into account weather conditions. Check carefully the preharvest interval at which you can harvest safely after the application of these products.\n\n3. Biofungicides: There is a strain of bacteria that is effective at treating cedar apple rust on apple trees. It is a special strain of Bacillus subtilis',
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
