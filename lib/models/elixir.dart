import 'package:wizarding_world_explorer/models/model.dart';

class Elixir extends Model {
  String id;
  String name;
  String? effect;
  String? sideEffects;
  String? characteristics;
  String? time;
  String? difficulty;
  List<Ingredient>? ingredients;
  List<Inventor>? inventors;
  String? manufacturer;

  Elixir(
      {required this.id,
      required this.name,
      this.effect,
      this.sideEffects,
      this.characteristics,
      this.time,
      this.difficulty,
      this.ingredients,
      this.inventors,
      this.manufacturer});

  factory Elixir.fromJson(Map<String, dynamic> json) {
    return Elixir(
      id: json['id'],
      name: json['name'],
      effect: json['effect'],
      sideEffects: json['sideEffects'],
      characteristics: json['characteristics'],
      time: json['time'],
      difficulty: json['difficulty'],
      ingredients: List<Ingredient>.from(
          json['ingredients'].map((x) => Ingredient.fromJson(x))),
      inventors: List<Inventor>.from(
          json['inventors'].map((x) => Inventor.fromJson(x))),
      manufacturer: json['manufacturer'],
    );
  }

  String get inventorsAsString {
    if (inventors == null || inventors!.isEmpty) {
      return 'No inventors';
    }
    return inventors!
        .map((inventor) =>
            '${inventor.firstName ?? 'Unknown'} ${inventor.lastName ?? 'Unknown'}')
        .join(', ');
  }

  String get ingredientsAsString {
    if (ingredients == null || ingredients!.isEmpty) {
      return 'No listed ingredients';
    }
    return ingredients!
        .map((ingredients) =>
            ingredients.name ?? 'Unknown')
        .join(', ');
  }
}

class Ingredient {
  String? id;
  String? name;

  Ingredient({this.id, this.name});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Inventor {
  String? id;
  String? firstName;
  String? lastName;

  Inventor({this.id, this.firstName, this.lastName});

  factory Inventor.fromJson(Map<String, dynamic> json) {
    return Inventor(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
