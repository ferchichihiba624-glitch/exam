import 'package:flutter/material.dart';
import 'countries_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atlas Géographique"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/globe.png", height: 200),
          SizedBox(height: 20),
          Text(
            "Découvrez les pays du monde",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            child: Text("Explorer"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CountriesPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
