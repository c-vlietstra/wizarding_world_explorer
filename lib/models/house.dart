import 'package:wizarding_world_explorer/models/model.dart';

class House extends Model {
  final String id;
  final String name;
  final String houseColours;
  final String founder;
  final String animal;
  final String element;
  final String ghost;
  final String commonRoom;
  final List<Head> heads;
  final List<Trait> traits;

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

class Head {
  final String id;
  final String firstName;
  final String lastName;

  Head({required this.id, required this.firstName, required this.lastName});

  factory Head.fromJson(Map<String, dynamic> json) {
    return Head(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}

class Trait {
  final String id;
  final String name;

  Trait({required this.id, required this.name});

  factory Trait.fromJson(Map<String, dynamic> json) {
    return Trait(
      id: json['id'],
      name: json['name'],
    );
  }
}
