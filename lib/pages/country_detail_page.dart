import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryDetailPage extends StatelessWidget {
  final Country country;

  CountryDetailPage({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(country.flag, height: 150),
            ),
            SizedBox(height: 20),
            Text("Capitale : ${country.capital}", style: TextStyle(fontSize: 18)),
            Text("Population : ${country.population}", style: TextStyle(fontSize: 18)),
            Text("Superficie : ${country.area}", style: TextStyle(fontSize: 18)),
            Text("Langue officielle : ${country.language}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
