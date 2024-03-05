import 'package:wizarding_world_explorer/models/model.dart';

// A class representing a Wizard, which extends the Model class.
class Wizard extends Model {
  // A list of Elixirs associated with the Wizard.
  final List<Elixir> elixirs;
  // A unique identifier for the Wizard.
  final String id;
  // The first name of the Wizard.
  final String? firstName;
  // The last name of the Wizard.
  final String lastName;

  // Constructor for the Wizard class.
  Wizard({
    required this.elixirs,
    required this.id,
    this.firstName,
    required this.lastName,
  });

  // A factory constructor that creates a Wizard instance from a JSON object.
  factory Wizard.fromJson(Map<String, dynamic> json) {
    return Wizard(
      // Converts the list of elixirs from JSON to a list of Elixir objects.
      elixirs: List<Elixir>.from(json['elixirs'].map((x) => Elixir.fromJson(x))),
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

// A class representing an Elixir.
class Elixir {
  // A unique identifier for the Elixir.
  final String id;
  // The name of the Elixir.
  final String name;

  // Constructor for the Elixir class.
  Elixir({required this.id, required this.name});

  // A factory constructor that creates an Elixir instance from a JSON object.
  factory Elixir.fromJson(Map<String, dynamic> json) {
    return Elixir(
      id: json['id'],
      name: json['name'],
    );
  }
}
