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

enum HouseName {
  gryffindor,
  hufflepuff,
  ravenclaw,
  slytherin,
}

const Map<HouseName, String> houseImages = {
  HouseName.gryffindor: 'assets/images/houses/gryffindor_house_emblem.webp',
  HouseName.hufflepuff: 'assets/images/houses/hufflepuff_house_emblem.webp',
  HouseName.ravenclaw: 'assets/images/houses/ravenclaw_house_emblem.webp',
  HouseName.slytherin: 'assets/images/houses/slytherin_house_emblem.webp',
};

enum HouseHead {
  mcgonagall,
  sprout,
  flitwick,
  snape,
  dumbledore,
  gryffindor,
  hufflepuff,
  ravenclaw,
  slytherin,
  slughorn,
  riddle,
}

const Map<HouseHead, String> houseHeadImages = {
  HouseHead.mcgonagall: 'assets/images/wizards/mcgonagall.webp',
  HouseHead.sprout: 'assets/images/wizards/sprout.webp',
  HouseHead.flitwick: 'assets/images/wizards/flitwick.webp',
  HouseHead.snape: 'assets/images/wizards/snape.webp',
  HouseHead.dumbledore: 'assets/images/wizards/dumbledore.webp',
  HouseHead.gryffindor: 'assets/images/wizards/gryffindor.webp',
  HouseHead.hufflepuff: 'assets/images/wizards/hufflepuff.webp',
  HouseHead.ravenclaw: 'assets/images/wizards/ravenclaw.webp',
  HouseHead.slytherin: 'assets/images/wizards/slytherin.webp',
  HouseHead.slughorn: 'assets/images/wizards/slughorn.webp',
  HouseHead.riddle: 'assets/images/wizards/riddle.webp',
};

enum TraitName {
  courage,
  chivalary,
  nerve,
  daring,
  determination,
  bravery,
  learning,
  acceptance,
  inteligence,
  wisdom,
  wit,
  creativity,
  hardworking,
  patience,
  loyalty,
  just,
  fairness,
  modesty,
  resourcefulness,
  selfPreservation,
  ambition,
  cunning,
  pride,
}

const Map<TraitName, String> traitImages = {
  TraitName.courage: 'assets/images/traits/courage.webp',
  TraitName.chivalary: 'assets/images/traits/chivalary.webp',
  TraitName.nerve: 'assets/images/traits/nerve.webp',
  TraitName.daring: 'assets/images/traits/daring.webp',
  TraitName.determination: 'assets/images/traits/determination.webp',
  TraitName.bravery: 'assets/images/traits/bravery.webp',
  TraitName.learning: 'assets/images/traits/learning.webp',
  TraitName.acceptance: 'assets/images/traits/acceptance.webp',
  TraitName.inteligence: 'assets/images/traits/inteligence.webp',
  TraitName.wisdom: 'assets/images/traits/wisdom.webp',
  TraitName.wit: 'assets/images/traits/wit.webp',
  TraitName.creativity: 'assets/images/traits/creativity.webp',
  TraitName.hardworking: 'assets/images/traits/hardworking.webp',
  TraitName.patience: 'assets/images/traits/patience.webp',
  TraitName.loyalty: 'assets/images/traits/loyalty.webp',
  TraitName.just: 'assets/images/traits/just.webp',
  TraitName.fairness: 'assets/images/traits/fairness.webp',
  TraitName.modesty: 'assets/images/traits/modesty.webp',
  TraitName.resourcefulness: 'assets/images/traits/resourcefulness.webp',
  TraitName.selfPreservation: 'assets/images/traits/selfperservation.webp',
  TraitName.ambition: 'assets/images/traits/ambition.webp',
  TraitName.cunning: 'assets/images/traits/cunning.webp',
  TraitName.pride: 'assets/images/traits/pride.webp',
};
