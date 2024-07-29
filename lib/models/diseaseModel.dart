// diseasemodel.dart
import 'package:flutter/material.dart';

class Disease {
  final String name;
  final String imagePath;
  final String readTime;
  final Widget detailPage;

  Disease({
    required this.name,
    required this.imagePath,
    required this.readTime,
    required this.detailPage,
  });
}
