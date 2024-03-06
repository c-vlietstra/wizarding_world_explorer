// Importing the 'Model' class from the 'wizarding_world_explorer/models' package.
import 'package:wizarding_world_explorer/models/model.dart';

// Defining the 'Elixir' class that extends the 'Model' class.
class Elixir extends Model {
  // Declaring properties of the 'Elixir' class.
  String id; // Unique identifier for the elixir.
  String name; // Name of the elixir.
  String? effect; // Effect of the elixir.
  String? sideEffects; // Possible side effects of the elixir.
  String? characteristics; // Characteristics of the elixir.
  String? time; // Time duration for the effect of the elixir.
  String? difficulty; // Difficulty level in preparing the elixir.
  List<Ingredient>? ingredients; // List of ingredients required for the elixir.
  List<Inventor>? inventors; // List of inventors who created the elixir.
  String? manufacturer; // Manufacturer of the elixir.

  // Constructor for the 'Elixir' class with required and optional parameters.
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

  // Factory constructor to create an instance of 'Elixir' from a JSON object.
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

  // Getter method to return a string representation of the inventors.
  String get inventorsAsString {
    if (inventors == null || inventors!.isEmpty) {
      return 'No inventors';
    }
    return inventors!
        .map((inventor) =>
            '${inventor.firstName ?? 'Unknown'} ${inventor.lastName ?? 'Unknown'}')
        .join(', ');
  }

  // Getter method to return a string representation of the ingredients.
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

// Defining the 'Ingredient' class.
class Ingredient {
  String? id; // Unique identifier for the ingredient.
  String? name; // Name of the ingredient.

  // Constructor for the 'Ingredient' class with optional parameters.
  Ingredient({this.id, this.name});

  // Factory constructor to create an instance of 'Ingredient' from a JSON object.
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
    );
  }
}

// Defining the 'Inventor' class.
class Inventor {
  String? id; // Unique identifier for the inventor.
  String? firstName; // First name of the inventor.
  String? lastName; // Last name of the inventor.

  // Constructor for the 'Inventor' class with optional parameters.
  Inventor({this.id, this.firstName, this.lastName});

  // Factory constructor to create an instance of 'Inventor' from a JSON object.
  factory Inventor.fromJson(Map<String, dynamic> json) {
    return Inventor(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
