import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddVisitScreen extends StatefulWidget {
  @override
  _AddVisitScreenState createState() => _AddVisitScreenState();
}

class _AddVisitScreenState extends State<AddVisitScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _docIdController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  final TextEditingController _diseaseController = TextEditingController();

  Future<void> _submitForm() async {
    final String userId = _userIdController.text.trim();
    final String docId = _docIdController.text.trim();
    final String symptoms = _symptomsController.text.trim();
    final String disease = _diseaseController.text.trim();

    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Uri url = Uri.parse('http://localhost:8000/create_visits');

    final String jsonData = json.encode({
      'user_id': userId,
      'doc_id': docId,
      'symptoms': symptoms,
      'disease': disease,
    });

    final http.Response response =
        await http.post(url, headers: headers, body: jsonData);

    if (response.statusCode == 200) {
      print('Visit added successfully');
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Visit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Visit',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(labelText: 'User ID'),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _docIdController,
              decoration: InputDecoration(labelText: 'Doctor ID'),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _symptomsController,
              decoration: InputDecoration(labelText: 'Symptoms'),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _diseaseController,
              decoration: InputDecoration(labelText: 'Disease'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
