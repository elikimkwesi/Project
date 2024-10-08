import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class PotatoEarlyBlight extends StatefulWidget {
  const PotatoEarlyBlight({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PotatoEarlyBlightState createState() => _PotatoEarlyBlightState();
}

class _PotatoEarlyBlightState extends State<PotatoEarlyBlight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                      tag: "Potato Early Blight",
                      child: AnotherCarousel(
                        images: const [
                          AssetImage('assets/16.jpg'),
                          AssetImage('assets/17.jpg'),
                          AssetImage('assets/18.jpg'),
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
                padding: const EdgeInsets.only(top: 270, left: 20, right: 20),
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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Potato Early Blight',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Alternaria solani',
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
          const Padding(
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
                      'Lower leaves often get infected when in contact with contaminated soil. Warm temperatures (24-29°C) and high humidity (90%) favor development of the disease. A long wet period (or alternating wet/dry weather) enhances the production of spores, which may be spread via wind, splashing rain or overhead irrigation. Tubers harvested green or in wet conditions are particularly susceptible to an infection. It often strikes after a period of heavy rainfall and is particularly destructive in tropical and subtropical areas.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1. Use certified pathogen-free seeds or transplants.\n\n2. Look for varieties that are resistant to the disease.\n\n3. Plant or transplant on raised beds to improve drainage.\n\n4. Orient rows in the direction of main winds and avoid shaded areas.\n\n5. Space plants to allow the canopy to dry quickly after rainfall or irrigation.\n\n6. Lay mulch on the soil to keep plants from touching the soil.\n\n7. Monitor fields for signs of the disease, particularly during wet weather.\n\n8. Remove bottom leaves that are too close to the soil.\n\n9. Remove leaves displaying symptoms and destroy them.\n\n10. Keep plants strong and vigorous with an adequate nutrition.\n\n11. Use stakes to keep plants upright.\n\n12. Use a drip irrigation system to minimize leaf wetness.\n\n13. Water plants in the morning so plants dry during the day.\n\n14. Control susceptible weeds in and around the field.\n\n15. Avoid working in fields when plants are wet.\n\n16. After harvest, remove plant debris and burn them (do not compost).\n\n17. Alternatively, plow debris deep in the soil (more than 45 cm).\n\n18. Plan a 2- or 3-year crop rotation with non-susceptible crops.\n\n19. Store tubers at cool temperatures and in well-aerated sites.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      'Application of products based on Bacillus subtilis or copper-based fungicides registered as organic can treat this disease. Always consider an integrated approach with preventive measures and biological treatments if available. There are numerous fungicides on the market for controlling early blight. Fungicides based on or combinations of azoxystrobin, pyraclostrobin, difenoconazole, boscalid, chlorothalonil, fenamidone, maneb, mancozeb, trifloxystrobin, and ziram can be used. Rotation of different chemical compounds is recommended. Apply treatments in a timely manner, taking into account weather conditions. Check carefully the preharvest interval at which you can harvest safely after the application of these products.',
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

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;

  const SectionContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        content,
        style: const TextStyle(fontSize: 17, fontFamily: 'Raleway'),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
