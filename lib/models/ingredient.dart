import 'package:wizarding_world_explorer/models/model.dart';

class Ingredient extends Model  {
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
