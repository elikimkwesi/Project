import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class PredictionPage extends StatefulWidget {
  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  File? _image;
  bool _isLoading = false;
  String _result = '';

  Future<void> pickFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await predictImage(_image!);
    }
  }

  Future<void> pickFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await predictImage(_image!);
    }
  }

  Future<void> predictImage(File image) async {
    if (_image == null) {
      print('Image is null. Cannot make a prediction.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://diseaseprediction-wgq4.onrender.com//predict'), // Replace with your server URL
      );

      // Add image file to the request
      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        var responseJson = jsonDecode(responseData.body);

        // Extract confidence and predicted_label
        String confidence = (responseJson['confidence'] ?? '').toString();
        String predictedLabel = responseJson['predicted_label'] ?? '';

        setState(() {
          _result = '$predictedLabel\nConfidence: $confidence';
        });
      } else {
        setState(() {
          _result = 'Prediction failed: ${response.statusCode}';
        });
      }
    } catch (e) {
      print('Error running prediction: $e');
      setState(() {
        _result = 'Error during prediction';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void showPickerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickFromCamera();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    pickFromGallery();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.cancel),
                  title: Text('Cancel'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // Set background color to green
      appBar: AppBar(title: Text('Plant Safe')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Introductory Text
            Text(
              'Hi! Welcome to Plant Safe!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Drop-down for "What is Plant Safe?"
            ExpansionTile(
              title: Text(
                'What is Plant Safe?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '✓ Turn your Android phone into a mobile crop doctor.\n'
                    '✓ With just one photo, PlantSafe diagnoses infected crops.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Drop-down for "How to Predict"
            ExpansionTile(
              title: Text(
                'How to Predict:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '1. Pick or take a picture of the sample.\n'
                    '2. Wait for the prediction result to be displayed.\n'
                    '3. The result will show the predicted label and confidence.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Image Display and Result Section
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      _image == null
                          ? Text('No image selected.', style: TextStyle(color: Colors.white))
                          : Column(
                              children: [
                                Image.file(_image!),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.green[700],
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Prediction Result:',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        _result,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
            SizedBox(height: 20),

            // Button to Pick or Take a Picture
            SizedBox(
              width: double.infinity, // Make button full-width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green, backgroundColor: Colors.white, // Set button text color
                  padding: EdgeInsets.symmetric(vertical: 16), // Adjust padding for height
                ),
                onPressed: () => showPickerModal(context),
                child: Text('Pick or Take a Picture', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
