import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class AvatarWidget extends StatefulWidget {
  @override
  _AvatarWidgetState createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  File? _avatarImage;

  @override
  void initState() {
    super.initState();
    _loadAvatarImage();
  }

  Future<void> _loadAvatarImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('avatarImagePath');
    if (imagePath != null) {
      setState(() {
        _avatarImage = File(imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundImage: _avatarImage != null
          ? FileImage(_avatarImage!)
          : const AssetImage("assets/images/placeholder_profile.png") as ImageProvider,
    );
  }
}
