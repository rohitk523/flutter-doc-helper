import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddDocScreen extends StatefulWidget {
  @override
  _AddDocScreenState createState() => _AddDocScreenState();
}

class _AddDocScreenState extends State<AddDocScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specialityController = TextEditingController();

  Future<void> _submitForm() async {
    final String name = _nameController.text.trim();
    final String speciality = _specialityController.text.trim();

    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Uri url = Uri.parse('http://localhost:8000/create_docs');

    final String jsonData =
        json.encode({'name': name, 'speciality': speciality});

    final http.Response response =
        await http.post(url, headers: headers, body: jsonData);

    if (response.statusCode == 200) {
      print('Doctor added successfully');
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Doctor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Doctor',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _specialityController,
              decoration: InputDecoration(labelText: 'Speciality'),
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
