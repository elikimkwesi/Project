import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import '/screens/classified_diseases_screen.dart';  // Import the ClassifiedDiseases screen

class TomatoSpider extends StatefulWidget {
  TomatoSpider({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  TomatoSpiderState createState() => TomatoSpiderState();
}

class TomatoSpiderState extends State<TomatoSpider> {
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
                      tag: "Tomato spider mites",
                      child: AnotherCarousel(
                        images: [
                          AssetImage('assets/spider.jpg'),
                          AssetImage('assets/spider2.png'),
                          AssetImage('assets/spider3.jpg'),
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
                          'Tomato spider mites',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Tetranychus urticae',
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
                      'The tomato red spider mites are pale-orange to red and feed on the underside of leaves. They cannot be seen easily with the naked eye. Feeding damage caused by sucking sap appears as many shiny pale yellow marks on the top of the tomato leaf. Eventually the leaves turn brown and die or fall off. Severe attack leads to formation of webs on the plant. Red spider mites are difficult but not impossible to control.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      '1. Spider mites reproduce rapidly in hot weather and commonly become numerous in June through September. If the temperature and food supplies are favorable, a generation can be completed in less than a week.\n\n2. Spider mites prefer hot, dusty conditions and usually are first found on trees or plants adjacent to dusty roadways or at margins of gardens. Plants under water stress also are highly susceptible.\n\n3. As foliage quality declines on heavily infested plants, female mites catch wind currents and disperse to other plants. High mite populations may undergo a rapid decline in late summer when predators overtake them, host plant conditions become unfavorable, and the weather turns cooler as well as following rain.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      'Avoid continuous cropping of tomato and related plants which makes it difficult to control red spider mites, since they always have a plant to feed on. Remove remains (residues) from a previous crop and destroy before planting new crop. Before transferring sticks (stakes) from an infested field to another, wash with soap and water and dry properly under direct sun for a week to avoid transfer of mites. Do the same for twines in the greenhouse. Inspect your crop borders for typical symptoms of red spider mite. Spray water regularly on plants to reduce dust, spider mites do well in dusty conditions.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      'When spraying ensure underside of leaf is covered by the chemical. Use fungicides with sulphur, since they reduce populations of mites. You can also use miticides which are specific for mites e.g. Dynamec (active ingredient abamectin), Oberon (spiromesifen) or Omite (propargite).',
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
