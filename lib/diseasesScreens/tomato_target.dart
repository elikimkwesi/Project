import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import '/screens/classified_diseases_screen.dart';  // Import the ClassifiedDiseases screen

class TomatoTarget extends StatefulWidget {
  const TomatoTarget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  TomatoTargetState createState() => TomatoTargetState();
}

class TomatoTargetState extends State<TomatoTarget> {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClassifiedDiseases()),
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
                      tag: "Tomato Target Spot",
                      child: AnotherCarousel(
                        images: const [
                          AssetImage('assets/target2.jpg'),
                          AssetImage('assets/target3.png'),
                          AssetImage('assets/target.jpg'),
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
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tomato Target Spot',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Corynespora cassiicola',
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
                      'On tomato leaves and stems, foliar symptoms of target spot consist of brown-black lesions with subtle, concentric rings, giving them a target-like appearance. These can sometimes be confused with early blight. With early blight, the lesions are often associated with a general chlorosis of the leaf. On tomato fruit, lesions are more distinct. Small, brown, slightly sunken flecks are seen initially and may resemble abiotic injury such as sandblasting. As fruits mature, the lesions become larger and coalesce, resulting in large, pitted areas. Advanced symptoms include large, deeply sunken lesions, often with visible dark-gray-to-black fungal growth in the center.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'This fungus has a broad host range on which it can survive. Infection occurs readily during periods of mild temperatures between 16-32°C (61-90°F) and high moisture. Fungal spores, which often form abundantly on the surface of infected tissues, are spread by air movement and rainfall.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1. Do not plant new crops next to older ones that have the disease. Plant as far as possible from papaya, especially if leaves have small angular spots.\n\n2. Check all seedlings in the nursery, and throw away any with leaf spots. Remove a few branches from the lower part of the plants to allow better airflow at the base.\n\n3. Remove and burn the lower leaves as soon as the disease is seen, especially after the lower fruit trusses have been picked. Keep plots free from weeds, as some may be hosts of the fungus.\n\n4. Do not use overhead irrigation; otherwise, it will create conditions for spore production and infection.\n\n5. Collect and burn as much of the crop as possible when the harvest is complete. Practise crop rotation, leaving 3 years before replanting tomato on the same land.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      'Warm wet conditions favour the disease such that fungicides are needed to give adequate control. The products to use are chlorothalonil, copper oxychloride or mancozeb. Treatment should start when the first spots are seen and continue at 10-14-day intervals until 3-4 weeks before last harvest. It is important to spray both sides of the leaves.',
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
