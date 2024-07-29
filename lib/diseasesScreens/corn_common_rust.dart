import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class CornCommonRust extends StatefulWidget {
  CornCommonRust({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CornCommonRustState createState() => _CornCommonRustState();
}

class _CornCommonRustState extends State<CornCommonRust> {
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
      extendBodyBehindAppBar: true,  // Ensures the AppBar is above the content
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: 300.0,
                child: AnotherCarousel(
                  images: [
                    AssetImage('assets/corn.jpg'),
                    AssetImage('assets/corn2.jpg'),
                    AssetImage('assets/corn3.png'),
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
                          'Corn Common Rust',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Puccinia sorghi Schwein',
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
                      'Early lesions on leaves are small, circular to elongate, and often occur in clusters. As lesions mature, the fungus erupts through the leaf surface (epidermis) and the lesions become more elongated. At this stage, a prominent yellow halo is usually evident. Brownish-red oblong pustules are the characteristic symptom on leaves; urediniospores that rub off on fingers are what impart the color to the lesion. Unlike Southern Rust of Corn, lesions of common rust are sparsely spread over the leaf and occur on both upper and lower leaf surfaces. Spores are wind-blown with new infections occurring every 7 to 14 days. As the season progresses, black teliospores are produced within the lesions. During this process, a single lesion may produce both brownish-red urediniospores and black teliospores. Finally, only black teliospores will be observed within the lesions.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'Cool temperatures (60-80° F) and high humidity favor disease development.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      'Genetic Resistance: Resistant varieties are the most cost-effective means to manage common rust. Consult your seed dealer to determine the best hybrids and inbreds for your area.\n\nCultural Practice: Since the pathogen does not survive in colder environments, cultivation and crop rotation do not affect common rust development.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      '1. To reduce the incidence of corn rust, plant only corn that has resistance to the fungus. Resistance is either in the form of race-specific resistance or partial rust resistance. In either case, no sweet corn is completely resistant.\n\n2. If the corn begins to show symptoms of infection, immediately spray with a fungicide. The fungicide is most effective when started at the first sign of infection.\n\n3. Hybrid selection: Choosing corn hybrids with genetic disease resistance offers the best economical and effective defense against corn rusts and other foliar diseases.\n\n4. Scouting: Early and frequent scouting for diseases is a routine best management practice to tackle problems before they lead to economic damage.\n\n5. Stratego® YLD fungicide from Bayer controls a broad spectrum of diseases; it combines the latest in triazole technology with a powerful, complementary strobilurin chemistry. This versatile fungicide can be applied early season.',
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
