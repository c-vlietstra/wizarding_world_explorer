import 'package:wizarding_world_explorer/models/model.dart';

// A class representing a House, which extends the Model class.
class House extends Model {
  // A unique identifier for the House.
  final String id;
  // The name of the House.
  final String name;
  // The colors associated with the House.
  final String houseColours;
  // The founder of the House.
  final String founder;
  // The animal symbol associated with the House.
  final String animal;
  // The element associated with the House.
  final String element;
  // The ghost associated with the House.
  final String ghost;
  // The common room of the House.
  final String commonRoom;
  // A list of Heads of the House.
  final List<Head> heads;
  // A list of Traits associated with the House.
  final List<Trait> traits;

  // Constructor for the House class.
  House({
    required this.id,
    required this.name,
    required this.houseColours,
    required this.founder,
    required this.animal,
    required this.element,
    required this.ghost,
    required this.commonRoom,
    required this.heads,
    required this.traits,
  });

  // A factory constructor that creates a House instance from a JSON object.
  // This method is used for deserializing JSON data into a House object.
  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'],
      name: json['name'],
      houseColours: json['houseColours'],
      founder: json['founder'],
      animal: json['animal'],
      element: json['element'],
      ghost: json['ghost'],
      commonRoom: json['commonRoom'],
      heads: List<Head>.from(json['heads'].map((x) => Head.fromJson(x))),
      traits: List<Trait>.from(json['traits'].map((x) => Trait.fromJson(x))),
    );
  }
}

// A class representing a Head of a House.
class Head {
  // A unique identifier for the Head.
  final String id;
  // The first name of the Head.
  final String firstName;
  // The last name of the Head.
  final String lastName;

  // Constructor for the Head class.
  Head({required this.id, required this.firstName, required this.lastName});

  // A factory constructor that creates a Head instance from a JSON object.
  factory Head.fromJson(Map<String, dynamic> json) {
    return Head(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

// A class representing a Trait associated with a House.
class Trait {
  // A unique identifier for the Trait.
  final String id;
  // The name of the Trait.
  final String name;

  // Constructor for the Trait class.
  Trait({required this.id, required this.name});

  // A factory constructor that creates a Trait instance from a JSON object.
  factory Trait.fromJson(Map<String, dynamic> json) {
    return Trait(
      id: json['id'],
      name: json['name'],
    );
  }
}
