import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class DiseasePredictionScreen extends StatefulWidget {
  const DiseasePredictionScreen({super.key});

  @override
  _DiseasePredictionScreenState createState() => _DiseasePredictionScreenState();
}

class _DiseasePredictionScreenState extends State<DiseasePredictionScreen> {
  File? _image;
  String _predictedClass = '';
  String _predictedLabel = '';

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _predictDisease() async {
    if (_image == null) return;

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:5001/predict'),
    );
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      setState(() {
        _predictedClass = jsonResponse['predicted_class'].toString();
        _predictedLabel = jsonResponse['predicted_label'];
      });
    } else {
      setState(() {
        _predictedClass = 'Error';
        _predictedLabel = 'Could not predict the disease.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease Prediction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? const Text('No image selected.')
                : Image.file(_image!),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictDisease,
              child: const Text('Predict Disease'),
            ),
            const SizedBox(height: 20),
            Text(
              'Predicted Class: $_predictedClass',
            ),
            Text(
              'Predicted Label: $_predictedLabel',
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
  home: DiseasePredictionScreen(),
));
