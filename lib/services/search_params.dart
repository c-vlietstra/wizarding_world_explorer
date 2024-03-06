// Importing the necessary screens from the 'wizarding_world_explorer/screens' package.
import 'package:wizarding_world_explorer/screens/elixirs_screen.dart';
import 'package:wizarding_world_explorer/screens/ingredients_screen.dart';
import 'package:wizarding_world_explorer/screens/spells_screen.dart';
import 'package:wizarding_world_explorer/screens/wizards_screen.dart';
// Importing the 'constants.dart' file from the 'utils' package for access to the 'SearchParams' enum.
import 'package:wizarding_world_explorer/utils/constants.dart';

// Defining a function 'getSearchParamsForScreen' that takes a dynamic screen object as an argument.
List<SearchParams> getSearchParamsForScreen(dynamic screen) {
  // Checking the type of the screen object and returning a list of appropriate search parameters.
  if (screen is ElixirsPage) {
    // If the screen is an instance of 'ElixirsPage', return the relevant search parameters for elixirs.
    return [
      SearchParams.name, // Search by name.
      SearchParams.difficulty, // Search by difficulty.
      SearchParams.ingredient, // Search by ingredient.
      SearchParams.manufacturer, // Search by manufacturer.
    ];
  } else if (screen is IngredientsPage) {
    // If the screen is an instance of 'IngredientsPage', return the relevant search parameters for ingredients.
    return [
      SearchParams.name, // Search by name.
    ];
  } else if (screen is SpellsPage) {
    // If the screen is an instance of 'SpellsPage', return the relevant search parameters for spells.
    return [
      SearchParams.name, // Search by name.
      SearchParams.type, // Search by type.
      SearchParams.incantation, // Search by incantation.
    ];
  } else if (screen is WizardsPage) {
    // If the screen is an instance of 'WizardsPage', return the relevant search parameters for wizards.
    return [
      SearchParams.firstName, // Search by first name.
      SearchParams.lastName, // Search by last name.
    ];
  } else {
    // If the screen is not an instance of any known page, return an empty list.
    return [];
  }
}
