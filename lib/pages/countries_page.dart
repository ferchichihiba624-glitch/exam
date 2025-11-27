import 'package:flutter/material.dart';
import '../data/countries_data.dart';
import '../models/country.dart';
import 'country_detail_page.dart';
import 'welcome_page.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  late Future<List<Country>> countries;

  @override
  void initState() {
    super.initState();
    countries = CountriesData.loadCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Pays"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.public, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Atlas Géographique',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("À propos"),
                    content: Text("Application Atlas Géographique\nPar Hiba"),
                    actions: [
                      TextButton(
                        child: Text("Fermer"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Quitter'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Country>>(
        future: countries,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final List<Country> list = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final country = list[index];
                final bool isEven = index % 2 == 0;

                return Card(
                  color: isEven ? Colors.blue[50] : Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        country.flag,
                        width: 50,
                        height: 30,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.public, color: Colors.grey, size: 40),
                      ),
                    ),
                    title: Text(
                      country.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CountryDetailPage(country: country)),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
