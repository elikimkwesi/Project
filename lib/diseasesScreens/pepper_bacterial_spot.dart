import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class PepperBacterialSpot extends StatefulWidget {
  const PepperBacterialSpot({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  PepperBacterialSpotState createState() => PepperBacterialSpotState();
}

class PepperBacterialSpotState extends State<PepperBacterialSpot> {
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
                      tag: "Pepper Bacterial Spot",
                      child: AnotherCarousel(
                        images: const [
                          AssetImage('assets/pepper1.jpg'),
                          AssetImage('assets/pepper2.png'),
                          AssetImage('assets/pepper3.jpg'),
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
                          'Pepper Bacterial Spot',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Xanthomonas campestris pv. vesicatoria',
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
                      'Pepper leaves have small (<1/8 inch), brown, circular spots that do not have a yellow halo and centers do not fall out. Small, brown, circular spots may also occur on stems and the fruit calyx. Fruit spots are ¼ inch, slightly raised, brown and scabby. Pepper fruit spots often occur on the stem-end of the fruit. Spots occur on green and red fruit but do not result in rot. Fruit spots (up to 0.5 cm, 0.2 in.) begin as pale-green, water-soaked areas, which eventually become raised, brown, and roughened on pepper (Figure 3) and tomato (Figure 11) fruit. Spots may provide entrance points for various fungal and other bacterial invaders that can cause secondary fruit rots.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'It survives in high temperatures (75°F to 86°F) and high humidity with frequent rainfall/overhead irrigation. Bacteria survive on plant debris in the soil for one to two years, but will not survive once plant debris is broken down. Introduction is primarily on infected seed or infected transplants. Even seedlings that do not show symptoms may be infected and will show symptoms later in the growing season. Bacteria can spread from plant to plant by tools, workers’ hands, or through splashing rain or irrigation water. Between rotations, the bacteria may survive on tomato or pepper volunteer plants.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1. Purchase high quality, certified disease free seed if possible. Hot water treatment can be used to kill bacteria on and in seed.\n\n2. For growers producing their own seedlings, avoid over-watering and handle plants as little as possible. Disinfect greenhouses, tools, and equipment between seedling crops with a commercial sanitizer.\n\n3. For growers purchasing transplants, buy plants from reputable growers who start with clean seed and use good cultural practices to reduce disease. Once plants are in the field, avoid overhead watering.\n\n4. Do not work in plants when wet to avoid spreading disease. Avoid high-pressure sprays, as these may injure leaves enough to encourage the introduction of the bacterial pathogen.\n\n5. Disinfect pruners and other tools by dipping in a commercial sanitizer, or a 1:9 dilution of germicidal bleach.\n\n6. To be efficient when pruning, have two pruners and alternate between plants to allow proper soaking time. Bury or remove crop debris at the end of the season.\n\n7. Rotate away from tomato or pepper for a year. It is important to control tomato or pepper volunteers during that time.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      'Pesticides are available to protect pepper from bacterial spot. Applications should be made when environmental conditions favor disease to be the most effective and repeated according to label instructions.',
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
