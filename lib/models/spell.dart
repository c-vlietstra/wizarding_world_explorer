import 'package:wizarding_world_explorer/models/model.dart';

// A class representing a Spell, which extends the Model class.
class Spell extends Model {
  // A unique identifier for the Spell.
  final String id;
  // The name of the Spell.
  final String name;
  // The incantation used to cast the Spell.
  final String? incantation;
  // The effect of the Spell when cast.
  final String effect;
  // A boolean indicating whether the Spell can be cast verbally.
  final bool? canBeVerbal;
  // The type of Spell (e.g., Charm, Curse, Hex).
  final String type;
  // The color of the light emitted by the Spell when cast.
  final String light;
  // The creator of the Spell.
  final String? creator;

  // Constructor for the Spell class.
  Spell({
    required this.id,
    required this.name,
    this.incantation,
    required this.effect,
    this.canBeVerbal,
    required this.type,
    required this.light,
    this.creator,
  });

  // A factory constructor that creates a Spell instance from a JSON object.
  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      id: json['id'],
      name: json['name'],
      incantation: json['incantation'],
      effect: json['effect'],
      canBeVerbal: json['canBeVerbal'],
      type: json['type'],
      light: json['light'],
      creator: json['creator'],
    );
  }
}
