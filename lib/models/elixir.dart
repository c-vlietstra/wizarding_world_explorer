import 'package:wizarding_world_explorer/models/model.dart';

class Elixir extends Model {
  final String id;
  final String name;
  final String effect;
  final String sideEffects;
  final String characteristics;
  final String time;
  final String difficulty;
  final List<Ingredient> ingredients;
  final List<Inventor> inventors;
  final String manufacturer;

  Elixir({
    required this.id,
    required this.name,
    required this.effect,
    required this.sideEffects,
    required this.characteristics,
    required this.time,
    required this.difficulty,
    required this.ingredients,
    required this.inventors,
    required this.manufacturer,
  });

  factory Elixir.fromJson(Map<String, dynamic> json) {
    return Elixir(
      id: json['id'],
      name: json['name'],
      effect: json['effect'],
      sideEffects: json['sideEffects'],
      characteristics: json['characteristics'],
      time: json['time'],
      difficulty: json['difficulty'],
      ingredients: List<Ingredient>.from(json['ingredients'].map((x) => Ingredient.fromJson(x))),
      inventors: List<Inventor>.from(json['inventors'].map((x) => Inventor.fromJson(x))),
      manufacturer: json['manufacturer'],
    );
  }
}

class Ingredient {
  final String id;
  final String name;

  Ingredient({required this.id, required this.name});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Inventor {
  final String id;
  final String firstName;
  final String lastName;

  Inventor({required this.id, required this.firstName, required this.lastName});

  factory Inventor.fromJson(Map<String, dynamic> json) {
    return Inventor(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
