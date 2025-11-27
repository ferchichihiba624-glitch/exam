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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // centre verticalement le contenu
          children: [
            // Si tu as toujours globe.png, sinon tu peux remplacer par une icône
            Image.asset(
              "assets/images/globe.png",
              height: 200,
              errorBuilder: (context, error, stackTrace) => 
                Icon(Icons.public, size: 100, color: Colors.blueAccent),
            ),
            SizedBox(height: 20),
            Text(
              "Découvrez les pays du monde",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Explorer",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountriesPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
