import 'package:wizarding_world_explorer/models/model.dart';

class Wizard extends Model  {
  final List<Elixir> elixirs;
  final String id;
  final String firstName;
  final String lastName;

  Wizard({
    required this.elixirs,
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Wizard.fromJson(Map<String, dynamic> json) {
    return Wizard(
      elixirs: List<Elixir>.from(json['elixirs'].map((x) => Elixir.fromJson(x))),
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

class Elixir {
  final String id;
  final String name;

  Elixir({required this.id, required this.name});

  factory Elixir.fromJson(Map<String, dynamic> json) {
    return Elixir(
      id: json['id'],
      name: json['name'],
    );
  }
}
