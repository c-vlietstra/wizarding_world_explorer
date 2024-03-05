import 'package:wizarding_world_explorer/models/model.dart';

// A class representing an Elixir, which extends the Model class.
class Elixir extends Model {
  // A unique identifier for the Elixir.
  final String id;
  // The name of the Elixir.
  final String name;
  // The effect of the Elixir.
  final String effect;
  // The side effects of the Elixir.
  final String sideEffects;
  // The characteristics of the Elixir.
  final String characteristics;
  // The time it takes to brew the Elixir.
  final String time;
  // The difficulty level of brewing the Elixir.
  final String difficulty;
  // A list of Ingredients required to brew the Elixir.
  final List<Ingredient> ingredients;
  // A list of Inventors who discovered or created the Elixir.
  final List<Inventor> inventors;
  // The manufacturer of the Elixir.
  final String manufacturer;

  // Constructor for the Elixir class.
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

  // A factory constructor that creates an Elixir instance from a JSON object.
  // This method is used for deserializing JSON data into an Elixir object.
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

// A class representing an Ingredient.
class Ingredient {
  // A unique identifier for the Ingredient.
  final String id;
  // The name of the Ingredient.
  final String name;

  // Constructor for the Ingredient class.
  Ingredient({required this.id, required this.name});

  // A factory constructor that creates an Ingredient instance from a JSON object.
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
    );
  }
}

// A class representing an Inventor of an Elixir.
class Inventor {
  // A unique identifier for the Inventor.
  final String id;
  // The first name of the Inventor.
  final String firstName;
  // The last name of the Inventor.
  final String lastName;

  // Constructor for the Inventor class.
  Inventor({required this.id, required this.firstName, required this.lastName});

  // A factory constructor that creates an Inventor instance from a JSON object.
  factory Inventor.fromJson(Map<String, dynamic> json) {
    return Inventor(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
