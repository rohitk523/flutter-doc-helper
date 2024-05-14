import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddVisitScreen extends StatefulWidget {
  const AddVisitScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        title: const Text('Add Visit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Visit',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(labelText: 'User ID'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _docIdController,
              decoration: const InputDecoration(labelText: 'Doctor ID'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _symptomsController,
              decoration: const InputDecoration(labelText: 'Symptoms'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _diseaseController,
              decoration: const InputDecoration(labelText: 'Disease'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
