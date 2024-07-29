import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class NorthernCornLeafBlight extends StatefulWidget {
  NorthernCornLeafBlight({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _NorthernCornLeafBlightState createState() => _NorthernCornLeafBlightState();
}

class _NorthernCornLeafBlightState extends State<NorthernCornLeafBlight> {
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
                child: AnotherCarousel(
                  images: [
                    AssetImage('assets/ncorn.JPG'),
                    AssetImage('assets/ncorn2.jpg'),
                    AssetImage('assets/ncorn3.png'),
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
                          'Northern Corn Leaf Blight',
                          style: TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Exserohilumturcicun',
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
                      'Northern corn leaf blight lesions become pale gray to tan as they enlarge to 1 to 6 inches or longer.Distinct cigar-shaped lesions unrestricted by leaf veins make northern corn leaf blight (NCLB) one of the easiest diseases to identify.Under moist conditions, lesions produce dark gray spores, usually on the lower leaf surface, giving the lesions a "dirty" appearance.As many lesions enlarge and coalesce, entire leaves or leaf areas may be covered.Heavy blighting and lesion coalescence give leaves a gray/burned appearance.',
                ),
                SectionTitle(title: 'FAVORABLE ENVIRONMENT CONDITIONS'),
                SectionContent(
                  content:
                      'Spores are spread by rain splash and air currents to the leaves of new crop plants in spring and early summer. Spores may be carried long distances by the wind.\n\nInfection occurs when free water is present on the leaf surface for 6 to 18 hours and temperatures are 65 to 80 F.',
                ),
                SectionTitle(title: 'MANAGEMENT (REMEDIES)'),
                SectionContent(
                  content:
                      '1.Crop rotation to reduce previous corn residues and disease inoculum\n\n2.Tillage to help break down crop debris and reduce inoculum load\n\n3.Fungicide application to reduce yield loss and improve harvestability\n\n4.Consider hybrid susceptibility, previous crop, tillage, field history, application cost, corn price.\n\n5.Growers should choose hybrids rated a "5" or "6" for fields at risk of NCLB infection',
                ),
                SectionTitle(title: 'CHEMICAL/BIOLOGICAL CONTROL'),
                SectionContent(
                  content:
                      'If disease levels were high the previous season, liquid copper fungicides can be sprayed to impede the fungal growth on the tree during the winter season. Sulfur sprays are only partially effective Maize. However, solutions containing sulfur and pyrethrins are available for organic control of the disease during the growing season. Always consider an integrated approach with preventive measures together with biological treatments if available. Protectant fungicides such as dodine, captan or dinathion can be sprayed around bud break to avoid the disease. Once it has been detected, fungicides based on difenoconazole, myclobutanil or sulphur can be used to control the development of the fungus. Ensure fungicides from different chemical groups are used to avoid the development of resistance.',
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
