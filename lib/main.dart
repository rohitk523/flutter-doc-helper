import 'package:doc_helper/screens/adddoc.dart';
import 'package:doc_helper/screens/adduserscreen.dart';
import 'package:doc_helper/screens/addvisit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (context) => HomeScreen(),
        '/add_user': (context) => AddUserScreen(),
        '/add_doc': (context) => AddDocScreen(),
        '/add_visit': (context) => AddVisitScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
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
              child: const Text('Add User'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_doc');
              },
              child: const Text('Add Doctor'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_visit');
              },
              child: const Text('Add Visit'),
            ),
          ],
        ),
      ),
    );
  }
}
