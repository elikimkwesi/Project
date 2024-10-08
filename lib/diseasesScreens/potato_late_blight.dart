import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class PotatoLateBlight extends StatefulWidget {
  const PotatoLateBlight({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PotatoLateBlightState createState() => _PotatoLateBlightState();
}

class _PotatoLateBlightState extends State<PotatoLateBlight> {
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
                      tag: "Potato Late Blight",
                      child: AnotherCarousel(
                        images: const [
                          AssetImage('assets/plate.jpg'),
                          AssetImage('assets/plate2.jpg'),
                          AssetImage('assets/plate3.jpeg'),
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
                          'Potato Late Blight',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Phytophthora infestans',
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
                      'Dark brown spots develop on the leaves starting at the tip or the leaf margins. In humid climates, these spots become water-soaked lesions. A white fungal covering can be seen on the underside of the leaves. As the disease progresses, entire leaves become necrotic, turn brown and die off. Similar lesions develop on stems and petioles. The potato tubers have greyish-blue spots on their skin and their flesh also turns brown, making them inedible. The rotting of the infested fields emits a distinctive odor.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'This fungus is an obligate parasite. This means that it must overwinter in plant debris and tubers as well as on alternative hosts to survive. It enters the plant via wounds and rips in the skin. Fungal spores germinate at higher temperatures during the spring and spread through wind or water. The disease is more severe in periods of cool nights (below 18°C), warm days (18-22°C), and extended wet conditions such as rain and fog (90% relative humidity). In these conditions, a late blight epidemic can occur.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1. Use healthy seeds or more tolerant plants.\n\n2. Make sure the field has good air ventilation and well-drained soil.\n\n3. Monitor fields and remove infected plants and surrounding ones.\n\n4. Use rotations of two to three years to non-host crops.\n\n5. Destroy volunteer hosts in and around the field.\n\n6. Avoid excessive fertilization with nitrogen.\n\n7. Use plant fortifiers.\n\n8. Store tubers at low temperatures and with good ventilation.\n\n9. Destroy tubers and plant debris after harvest burying them two feet deep or feeding them to animals.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      'Apply copper-based fungicides before dry weather. Foliar sprays of organic coating agents can also prevent the infection. Always consider an integrated approach with preventive measures together with biological treatments if available. Fungicide applications are important to control late blight, particularly in humid areas. Contact fungicides that coat leaves are effective before infections and do not trigger resistance in the fungi. Fungicides containing mandipropamid, chlorothalonil, fluazinam, or mancozeb can also be used as a preventive treatment. Seed treatment before sowing with fungicides like mancozeb also work.',
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
