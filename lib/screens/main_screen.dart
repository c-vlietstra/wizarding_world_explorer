// Importing necessary packages for Flutter widgets, Riverpod state management, and custom services and widgets.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/providers/current_screen_provider.dart';
import 'package:wizarding_world_explorer/services/search_params.dart';
import 'package:wizarding_world_explorer/services/search_service.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';
import 'package:wizarding_world_explorer/widgets/collapsing_side_drawer.dart';

// Defining the MainPage class as a ConsumerStatefulWidget to use Riverpod for state management.
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  // Initializing variables for search functionality.
  SearchParams _selectedSearchParam = SearchParams.name; // Default search parameter.
  String _searchQuery = ''; // The current search query.
  final TextEditingController textEditingController = TextEditingController(); // Controller for the search text field.

  @override
  Widget build(BuildContext context) {
    // Watching the current screen and search service providers for updates.
    final currentScreen = ref.watch(currentScreenProvider);
    final searchParams = getSearchParamsForScreen(currentScreen); // Get the available search parameters for the current screen.
    final searchService = ref.read(searchServiceProvider); // Reading the search service to use its methods.

    // Listen for changes in the current screen and reset the search query and text field when the screen changes.
    ref.listen<Widget>(currentScreenProvider, (previousScreen, currentScreen) {
      textEditingController.text = ''; // Clear the text field.
      searchService.resetSearchQuery(); // Reset the search query in the search service.
    });

    // Reset the selected search parameter if it's not available in the new list of parameters for the current screen.
    if (!searchParams.contains(_selectedSearchParam)) {
      _selectedSearchParam = searchParams.isNotEmpty ? searchParams.first : SearchParams.name;
    }

    // Building the UI for the MainPage.
    return Scaffold(
      appBar: AppBar(
        title: searchParams.isNotEmpty
            ? Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value; // Update the search query state.
                        });
                        // Update the search query parameters in the search service.
                        searchService.updateSearchQuery({
                          searchParamNames[_selectedSearchParam]!.toLowerCase(): _searchQuery,
                        });
                      },
                      controller: textEditingController, // Using the text controller for the text field.
                      decoration: const InputDecoration(
                        hintText: 'Search...', // Placeholder text for the search field.
                        border: InputBorder.none, // Removing the border for a cleaner look.
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background, // Using the theme's background color for the dropdown container.
                      borderRadius: BorderRadius.circular(5), // Rounded corners for the dropdown container.
                    ),
                    child: DropdownButton<SearchParams>(
                      isDense: true, // Reducing the vertical size of the dropdown.
                      value: _selectedSearchParam, // The currently selected search parameter.
                      onChanged: (SearchParams? newValue) {
                        setState(() {
                          _selectedSearchParam = newValue!; // Update the selected search parameter.
                        });
                      },
                      items: searchParams.map<DropdownMenuItem<SearchParams>>((SearchParams value) {
                        return DropdownMenuItem<SearchParams>(
                          value: value,
                          child: Text(searchParamNames[value]!), // Display the name of the search parameter.
                        );
                      }).toList(),
                      icon: const Icon(Icons.arrow_drop_down), // Dropdown arrow icon.
                      iconSize: 24, // Size of the dropdown arrow icon.
                      underline: Container(), // Removes the underline for a cleaner look.
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer, // Text color for the dropdown items.
                        fontSize: 16, // Font size for the dropdown items.
                      ),
                    ),
                  ),
                ],
              )
            : const Text('Wizarding World Explorer'), // Default title when no search parameters are available.
        backgroundColor: Theme.of(context).colorScheme.primaryContainer, // Background color for the app bar.
        elevation: 8.0, // Elevation for the app bar.
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              left: 65, // Margin to accommodate the side drawer.
              right: 10, // Right margin for some spacing.
            ),
            child: currentScreen, // Displaying the current screen in the main area.
          ),
          const CollapsingNavigationDrawer(), // Side navigation drawer.
        ],
      ),
    );
  }
}
