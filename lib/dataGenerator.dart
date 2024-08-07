import 'package:harvestify/diseasesScreens/orange_citrus.dart';
import 'package:harvestify/diseasesScreens/pepper_bacterial_spot.dart';
import 'package:harvestify/diseasesScreens/potato_early_blight.dart';
import 'package:harvestify/diseasesScreens/potato_late_blight.dart';
import 'package:harvestify/diseasesScreens/tomato_bacteria_spot.dart';
import 'package:harvestify/diseasesScreens/tomato_early_blight.dart';
import 'package:harvestify/diseasesScreens/tomato_late_blight.dart';
import 'package:harvestify/diseasesScreens/tomato_leaf_mold.dart';
import 'package:harvestify/diseasesScreens/tomato_leaf_spot.dart';
import 'package:harvestify/diseasesScreens/tomato_mosaic.dart';
import 'package:harvestify/diseasesScreens/tomato_spider.dart';
import 'package:harvestify/diseasesScreens/tomato_target.dart';
import 'package:harvestify/diseasesScreens/tomato_yellow.dart';

import '/models/diseaseModel.dart';
import '/diseasesScreens/corn_common_rust.dart';
import '/diseasesScreens/corn_gray_leaf.dart';
import '/diseasesScreens/northern_corn_leaf_blight.dart';

class DataGenerator {
  static List<Disease> generateDiseases() {
    return [
      Disease(
        name: 'Corn Common Rust',
        imagePath: 'assets/corn.jpg',
        readTime: '5 mins read',
        detailPage: const CornCommonRust(title: '',),
      ),
      Disease(
        name: 'Corn Gray Leaf',
        imagePath: 'assets/corngray.jpeg',
        readTime: '5 mins read',
        detailPage: const CornGrayLeaf(title: '',),
      ),
      Disease(
        name: 'Northern Corn Leaf Blight',
        imagePath: 'assets/ncorn.JPG',
        readTime: '5 mins read',
        detailPage: const NorthernCornLeafBlight(title: '',),
      ),
      Disease(
        name: 'Orange Citrus Greening',
        imagePath: 'assets/orange.jpg',
        readTime: '5 mins read',
        detailPage: const OrangeCitrus(title: '',),
      ),
      Disease(
        name: 'Pepper Bacterial Spot',
        imagePath: 'assets/pepper1.jpg',
        readTime: '5 mins read',
        detailPage: const PepperBacterialSpot(title: '',),
      ),
      Disease(
        name: 'Potato Early Blight',
        imagePath: 'assets/16.jpg',
        readTime: '5 mins read',
        detailPage: const PotatoEarlyBlight(title: '',),
      ),
      Disease(
        name: 'Potato Late Blight',
        imagePath: 'assets/plate.jpg',
        readTime: '5 mins read',
        detailPage: const PotatoLateBlight(title: '',),
      ),
      Disease(
        name: 'Tomato Bacteria Spot',
        imagePath: 'assets/tomato1.png',
        readTime: '5 mins read',
        detailPage: TomatoBacteriaSpot(title: '',),
      ),
      Disease(
        name: 'Tomato Early Blight',
        imagePath: 'assets/tlb.jpg',
        readTime: '5 mins read',
        detailPage: TomatoEarlyBlight(title: '',),
      ),
      Disease(
        name: 'Tomato Late Blight',
        imagePath: 'assets/latetomato.jpg',
        readTime: '5 mins read',
        detailPage: TomatoLateBlight(title: '',),
      ),
      Disease(
        name: 'Tomato Leaf Mold',
        imagePath: 'assets/mold1.jpg',
        readTime: '5 mins read',
        detailPage: TomatoLeafMold(title: '',),
      ),
      Disease(
        name: 'Tomato Septoria Leaf Spot',
        imagePath: 'assets/tomatospot2.jpeg',
        readTime: '5 mins read',
        detailPage: TomatoLeafSpot(title: '',),
      ),
      Disease(
        name: 'Tomato Spider Mites',
        imagePath: 'assets/spider.jpg',
        readTime: '5 mins read',
        detailPage: const TomatoSpider(title: '',),
      ),
      Disease(
        name: 'Tomato Target spot',
        imagePath: 'assets/target2.jpg',
        readTime: '5 mins read',
        detailPage: const TomatoTarget(title: '',),
      ),
      Disease(
        name: 'Tomato Yellow Leaf Curl Virus',
        imagePath: 'assets/curl.png',
        readTime: '5 mins read',
        detailPage: const TomatoYellow(title: '',),
      ),
      Disease(
        name: 'Tomato Mosaic Virus ',
        imagePath: 'assets/mosaic2.jpg',
        readTime: '5 mins read',
        detailPage: const TomatoMosaic(title: '',),
      ),
    ];
  }
}
