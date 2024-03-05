import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/providers/current_screen_provider.dart';
import 'package:wizarding_world_explorer/services/search_params.dart';
import 'package:wizarding_world_explorer/services/search_service.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';
import 'package:wizarding_world_explorer/widgets/collapsing_side_drawer.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  SearchParams _selectedSearchParam = SearchParams.name;
  String _searchQuery = '';
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentScreen = ref.watch(currentScreenProvider);
    final searchParams = getSearchParamsForScreen(currentScreen);
    final searchService = ref.read(searchServiceProvider);

    ref.listen<Widget>(currentScreenProvider, (previousScreen, currentScreen) {
      textEditingController.text = '';
      searchService.resetSearchQuery();
    });

    // Reset the selected search parameter if it's not in the new list
    if (!searchParams.contains(_selectedSearchParam)) {
      _selectedSearchParam =
          searchParams.isNotEmpty ? searchParams.first : SearchParams.name;
    }

    return Scaffold(
      appBar: AppBar(
        title: searchParams.isNotEmpty
            ? Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                        // Update the search query parameters
                        searchService.updateSearchQuery({
                          searchParamNames[_selectedSearchParam]!.toLowerCase():
                              _searchQuery,
                        });
                      },
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton<SearchParams>(
                      isDense: true,
                      value: _selectedSearchParam,
                      onChanged: (SearchParams? newValue) {
                        setState(() {
                          _selectedSearchParam = newValue!;
                        });
                      },
                      items: searchParams.map<DropdownMenuItem<SearchParams>>(
                          (SearchParams value) {
                        return DropdownMenuItem<SearchParams>(
                          value: value,
                          child: Text(searchParamNames[value]!),
                        );
                      }).toList(),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      underline: Container(), // Removes the underline
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            : const Text('Wizarding World Explorer'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 8.0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              left: 65,
              right: 10,
            ),
            child: currentScreen,
          ),
          const CollapsingNavigationDrawer(),
        ],
      ),
    );
  }
}
