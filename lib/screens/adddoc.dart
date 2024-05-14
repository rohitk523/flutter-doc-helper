import 'package:doc_helper/screens/welcomedoctor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddDocScreen extends StatefulWidget {
  const AddDocScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
      // Navigate to the welcome screen for doctors
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeDoctorScreen()),
      );
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Image.asset(
                'images/niggatron.png', // Replace with your image path
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              flex: 1,
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: _specialityController,
                      decoration:
                          const InputDecoration(labelText: 'Speciality'),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
