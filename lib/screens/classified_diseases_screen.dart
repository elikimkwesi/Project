import 'package:flutter/material.dart';
import '/models/diseaseModel.dart';
import '/dataGenerator.dart';

class ClassifiedDiseases extends StatefulWidget {
  @override
  _ClassifiedDiseasesState createState() => _ClassifiedDiseasesState();
}

class _ClassifiedDiseasesState extends State<ClassifiedDiseases> {
  List<Disease> diseases = DataGenerator.generateDiseases();
  List<Disease> filteredDiseases = [];

  @override
  void initState() {
    super.initState();
    filteredDiseases = diseases;
  }

  void filterDiseases(String query) {
    final results = diseases.where((disease) => disease.name.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      filteredDiseases = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classified Diseases'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterDiseases,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDiseases.length,
              itemBuilder: (context, index) {
                final disease = filteredDiseases[index];
                return ListTile(
                  leading: Image.asset(disease.imagePath, fit: BoxFit.cover, width: 60.0, height: 60.0),
                  title: Text(disease.name),
                  subtitle: Text(disease.readTime),
                  trailing: Text('Read', style: TextStyle(color: Colors.blue)),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => disease.detailPage),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
