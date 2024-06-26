import 'package:flutter/material.dart';
import 'package:doc_helper/screens/adddoc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AddDocScreen(),
        // '/add_user': (context) => AddUserScreen(),
        // '/add_doc': (context) => const AddDocScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_user');
              },
              child: const Text('I am a User'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_doc');
              },
              child: const Text('I am a Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}
