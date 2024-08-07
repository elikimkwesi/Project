import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class CornGrayLeaf extends StatefulWidget {
  const CornGrayLeaf({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CornGrayLeafState createState() => _CornGrayLeafState();
}

class _CornGrayLeafState extends State<CornGrayLeaf> {
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
                child: AnotherCarousel(
                  images: const [
                    AssetImage('assets/corngray.jpeg'),
                    AssetImage('assets/corngray2.png'),
                    AssetImage('assets/corngray3.png'),
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
                          'Corn Gray Leaf',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Cercospora zea-maydis',
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
                      'All corn hybrids and inbreds are susceptible to Gray Leaf Spot (GLS). In minimum tillage fields with a history of GLS, symptoms can occur on the lower leaves prior to tasseling. Immature GLS lesions can be easily confused with lesions caused by other pathogens; e.g., eyespot (Kabatiella), anthracnose (Colletrichum). Mature lesions on leaves are rectangular in shape and restricted by leaf veins; reverse lighting reveals a yellow halo on most hybrids. Mature lesions are diagnostic and easily distinguishable from other diseases. As lesions expand they coalesce resulting in a blighting of large portions of the leaf. When the source of primary innoculum is within the field, symptoms originate on the lower leaves and progress up the plant as infection cycles occur. When severe, the entire plant may be blighted. Stalk infections have been reported and can result in lodging if severe. Lesions on sheath or husk tissues may be be oval to ellipsoidal in shape and are not usually diagnostic. Severely affected fields can appear to be experiencing early dry-down. The time from infection to the production of more innoculum can be 14-21 days on a susceptible hybrid and 21-28 days on a tolerant hybrid.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'Temperature: 70°-90° F/25°-32° C, Relative Humidity: >12 hours @ > 90% RH, and Leaf Wetness: >12 hours of leaf wetness (from dew, rain, or irrigation).',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      'In order to best prevent and manage corn grey leaf spot, the overall approach is to reduce the rate of disease growth and expansion. This is done by limiting the amount of secondary disease cycles and protecting leaf area from damage until after corn grain formation. High risks for corn grey leaf spot are divided into eight factors, which require specific management strategies.\n\n1. Susceptible hybrid.\n\n2.Continuous corn.\n\n3.Late planting date.\n\n4.Minimum tillage systems.\n\n5.Field history of severe disease.\n\n6.Early disease activity (before tasseling).\n\n7.Irrigation and Favorable weather forecast for disease.\n\nThere are currently three different management strategies, some of which are more effective than others.\n\n1.Resistant varieties: In places where leaf spot occur, these crops can ultimately grow and still be resistant to the disease. Although the disease is not completely eliminated and resistant varieties show disease symptoms, at the end of the growing season, the disease is not as effective in reducing crop yield\n\n2.Crop rotation: The amount of initial inoculum will be reduced when a crop other than corn is planted for ≥2 years in that given area; meanwhile proper tillage methods are carried out\n\n3.Residue management: Burying the debris under the last year’s crop will help in reducing the presence of Cercospera zeae-maydis, as the fungal-infected debris can only survive above the soil surface.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      '1. Under high disease pressure, timely fungicide applications can greatly minimize impact on yield. These applications are costly and usually only practical when disease pressure is high.\n\n2.Proline 480 SC: Proline 480 SC is to be applied at 420 mL per/ha. This fungicide can only be applied a maximum 1 time/year. It should be note that only ground application is acceptable.\n\n3. Tilt 250 and Bumper 418 EC: Tilt 250 is to be applied at 500 mL/ha. Bumper 418 EC is to be applied at 300 mL/ha. Both fungicides are to be applied when rust pustules first appear. If disease is prevalent after primary application, a second application 14 days later may be necessary.',
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
