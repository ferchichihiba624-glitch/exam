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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final country = list[index];

              return ListTile(
                leading: Image.asset(
                  country.flag,
                  width: 40,
                  height: 25,
                  fit: BoxFit.cover,
                ),
                title: Text(country.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CountryDetailPage(country: country)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
