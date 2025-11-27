import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(AtlasGeoApp());
}

class AtlasGeoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // supprime la bannière DEBUG
      title: 'Atlas Géographique',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(), // c'est la première page
    );
  }
}
