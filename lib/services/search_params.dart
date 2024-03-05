import 'package:wizarding_world_explorer/screens/elixirs_screen.dart';
import 'package:wizarding_world_explorer/screens/ingredients_page.dart';
import 'package:wizarding_world_explorer/screens/spells_screen.dart';
import 'package:wizarding_world_explorer/screens/wizards_screen.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';

List<SearchParams> getSearchParamsForScreen(dynamic screen) {
  if (screen is ElixirsPage) {
    return [
      SearchParams.name,
      SearchParams.difficulty,
      SearchParams.ingredient,
      SearchParams.manufacturer,
    ];
  } else if (screen is IngredientsPage) {
    return [
      SearchParams.name,
    ];
  } else if (screen is SpellsPage) {
    return [
      SearchParams.name,
      SearchParams.type,
      SearchParams.incantation,
    ];
  } else if (screen is WizardsPage) {
    return [
      SearchParams.firstName,
      SearchParams.lastName,
    ];
  } else {
    return [];
  }
}
