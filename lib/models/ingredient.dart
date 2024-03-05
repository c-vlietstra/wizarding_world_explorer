import 'package:wizarding_world_explorer/models/model.dart';

// A class representing an Ingredient, which extends the Model class.
class Ingredient extends Model {
  // A unique identifier for the Ingredient.
  final String id;
  // The name of the Ingredient.
  final String name;

  // Constructor for the Ingredient class.
  Ingredient({
    required this.id,
    required this.name,
  });

  // A factory constructor that creates an Ingredient instance from a JSON object.
  // This method is used for deserializing JSON data into an Ingredient object.
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'], // Extracts the 'id' field from the JSON object.
      name: json['name'], // Extracts the 'name' field from the JSON object.
    );
  }
}
