// Importing model classes for House, Ingredient, Spell, and Wizard.
import 'package:wizarding_world_explorer/models/house.dart';
import 'package:wizarding_world_explorer/models/ingredient.dart';
import 'package:wizarding_world_explorer/models/spell.dart';
import 'package:wizarding_world_explorer/models/wizard.dart';

// Base URL for the Wizard World API.
const String baseUrl = 'https://wizard-world-api.herokuapp.com';

// Enum representing the different API endpoints.
enum ApiEndpoints {
  house,
  houses,
  spell,
  spells,
  elixir,
  elixirs,
  wizard,
  wizards,
  ingredient,
  ingredients,
}

// Extension on the ApiEndpoints enum to provide URL strings and collection checks.
extension ApiEndpointsExtension on ApiEndpoints {
  // Returns the URL path for the endpoint, optionally appending an ID for singular resources.
  String url([String? id]) {
    switch (this) {
      case ApiEndpoints.house:
        return 'houses/$id';
      case ApiEndpoints.houses:
        return 'houses';
      case ApiEndpoints.spell:
        return 'spells/$id';
      case ApiEndpoints.spells:
        return 'spells';
      case ApiEndpoints.wizard:
        return 'characters/$id';
      case ApiEndpoints.wizards:
        return 'characters';
      case ApiEndpoints.elixir:
        return 'potions/$id';
      case ApiEndpoints.elixirs:
        return 'potions';
      case ApiEndpoints.ingredient:
        return 'ingredients/$id';
      case ApiEndpoints.ingredients:
        return 'ingredients';
      default:
        return '';
    }
  }

  // Indicates whether the endpoint represents a collection of resources.
  bool get isCollection {
    switch (this) {
      case ApiEndpoints.houses:
      case ApiEndpoints.spells:
      case ApiEndpoints.wizards:
      case ApiEndpoints.elixirs:
      case ApiEndpoints.ingredients:
        return true;
      default:
        return false;
    }
  }
}

// Mapping of API endpoints to their corresponding model's fromJson function.
final Map<ApiEndpoints, Function> endpointToModel = {
  ApiEndpoints.house: House.fromJson,
  ApiEndpoints.houses: House.fromJson,
  ApiEndpoints.spell: Spell.fromJson,
  ApiEndpoints.spells: Spell.fromJson,
  ApiEndpoints.wizard: Wizard.fromJson,
  ApiEndpoints.wizards: Wizard.fromJson,
  ApiEndpoints.elixir: Elixir.fromJson,
  ApiEndpoints.elixirs: Elixir.fromJson,
  ApiEndpoints.ingredient: Ingredient.fromJson,
  ApiEndpoints.ingredients: Ingredient.fromJson,
};
