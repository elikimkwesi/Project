import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import '/screens/classified_diseases_screen.dart';  // Import the ClassifiedDiseases screen

class TomatoYellow extends StatefulWidget {
  const TomatoYellow({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  TomatoYellowState createState() => TomatoYellowState();
}

class TomatoYellowState extends State<TomatoYellow> {
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
                      tag: "Tomato Yellow Leaf Curl Virus",
                      child: AnotherCarousel(
                        images: const [
                          AssetImage('assets/curl.png'),
                          AssetImage('assets/curl2.jpg'),
                          AssetImage('assets/curl3.jpg'),
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
                          'Tomato Yellow Leaf Curl Virus',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Tomato Yellow Leaf Curl Virus',
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
                      '1. The disease can be easily recognized when tomato plants are infected at the seedling stage. TYLCV causes severe stunting of young leaves and shoots, resulting in bushy growth of infected seedlings.\n\n2. Affected plants exhibit upward and inward rolling of the leaf margins, interveinal yellowing of leaflets and marked stunting. The virus reduces fruit set considerably, especially when infection takes place before the flowering stage.\n\n3. There are no noticeable symptoms on fruits derived from infected plants. Flowers formed on infected plants commonly do not develop and fall off (abscise).\n\n4. Fruit production is dramatically reduced, particularly when plants are infected at an early age, and it is not uncommon for losses of 100% to be experienced in fields with heavily infected plants.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'The primary way the virus is spread short distances is by Bemisia whitefly species. Over long distance, the virus is primarily spread through the movement of infected plants, especially tomato transplants. Because it can take up to 3 weeks for disease symptoms to develop, infected symptomless plants could be unknowingly transported. The virus also can be moved long distance by virus-carrying whiteflies that are transported on tomatoes or other plants (e.g., ornamentals) or via high winds, hurricanes, or tropical storms.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1. Select TYLCV-resistant varieties. Use virus- and whitefly-free transplants.\n\n2. DO NOT import tomato (or any potential whitefly host) transplants from areas known to have the virus. Plant immediately after any tomato-free period or true winter season.\n\n3. Avoid planting new fields near older fields (especially those with TYLCV-infected plants). Manage WHITEFLIES.\n\n4. Cover plants with floating row covers of fine mesh (Agryl or Agribon) to protect from whitefly infestations. Rogue diseased plants when incidence of virus infection is low.\n\n5. Practice good weed management in and around fields to the extent feasible. Remove and destroy old crop residue and volunteers on a regional basis.\n\n6. A voluntary or enforced regional host-free period in areas lacking a true winter season (i.e., temperatures low enough to prevent crop cultivation and whitefly survival) might be a useful management tool. The crops to be included in a region will depend on the agroecosystem.',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      '1. Use a neonicotinoid insecticide, such as dinotefuran (Venom) imidacloprid (AdmirePro, Alias, Nuprid, Widow, and others) or thiamethoxam (Platinum), as a soil application or through the drip irrigation system at transplanting of tomatoes or peppers.\n\n2. A highly UV-reflective mulch (metalized) and low rates of crop oil (0.25 -0.50 percent) can be used as whitefly repellents to reduce whitefly feeding and virus transmission.\n\n3. Sanitation is very important for preventing the migration of whitefly adults and the spread of TYLCV.\n\n4. Rogue tomato or pepper plants with early symptoms of TYLCV can be removed from fields by placing infected-looking plants in plastic bags immediately at the beginning season, especially during first three to four weeks.',
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
