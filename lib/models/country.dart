class Country {
  final String name;
  final String capital;
  final String population;
  final String area;
  final String language;
  final String flag;

  Country({
    required this.name,
    required this.capital,
    required this.population,
    required this.area,
    required this.language,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['nom'],
      capital: json['capitale'],
      population: json['population'],
      area: json['superficie'],
      language: json['langues'],
      flag: "assets/images/${json['nom'].toLowerCase().replaceAll(' ', '_')}.png",
    );
  }
}
