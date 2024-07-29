// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import '/screens/classified_diseases_screen.dart';  // Make sure to import the ClassifiedDiseases screen

class TomatoLateBlight extends StatefulWidget {
  TomatoLateBlight({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TomatoLateBlightState createState() => _TomatoLateBlightState();
}

class _TomatoLateBlightState extends State<TomatoLateBlight> {
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
                      tag: "Tomato Late Blight",
                      child: AnotherCarousel(
                        images: [
                          AssetImage('assets/latetomato.jpg'),
                          AssetImage('assets/latetomato2.jpeg'),
                          AssetImage('assets/latetomato3.jpg'),
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
                          'Tomato Late Blight',
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
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: 'SYMPTOMS'),
                SectionContent(
                  content:
                      'Brownish-green spots appear on the leaf margins and leaf tops. Later, large areas of the leaves turn brown completely. During wet weather, lesions on the lower side of the leaves may be covered with a gray to white moldy growth, making it easier to distinguish healthy from dead leaf tissue. As the disease progresses, the foliage runs brown, curls and dries. In some cases, the sharply delimited brown spots and the white covering also appear on the stems, branches, and petioles. Greyish-green to dirty-brown and wrinkled stains appear on the fruits. At these spots, the fruit flesh is hardened.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'The fungus enters the plant via wounds and rips in the skin. Temperature and moisture are the most important environmental factors affecting the development of the disease. Late blight fungi grow best in high relative humidities (around 90%) and in temperature ranges of 18 to 26°C. Warm and dry summer weather can bring the spread of the disease to a halt.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1. Tomatoes and potatoes should not be cultivated next to each other.\n\n2. Try to keep plants dry though good drainage and ventilation of your cultures.\n\n3. Installing a simple transparent rain shelter with the help of a tarpaulin and wooden stakes might help.\n\n4. Silicate-containing fertilizers may increase the resistance to the fungus, especially in the seedling stage.\n\n5. Avoid irrigation late in the day and irrigate plants at ground level.\n\n6. Use plant fortifier for general strengthening of the plants.\n\n7. Crop rotation of two to three years with non-host crops is recommended.\n\n8. Purchase healthy seeds from reliable retailers.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      '1. At this point, there is no biological control of known efficacy against late blight. To avoid spreading, remove and destroy plants around the infected spot immediately and do not compost infected plant material.\n\n2. Always consider an integrated approach with preventive measures together with biological treatments if available. Use fungicide sprays based on mandipropamid, chlorothalonil, fluazinam, mancozeb to combat late blight. Fungicides are generally needed only if the disease appears during a time of year when rain is likely or overhead irrigation is practiced.\n\n3. Biofungicides: There is a strain of bacteria that is effective at treating cedar apple rust on apple trees. It is a special strain of Bacillus subtilis.',
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
