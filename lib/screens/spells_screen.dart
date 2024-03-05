import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/models/spell.dart';
import 'package:wizarding_world_explorer/providers/search_query_provider.dart';
import 'package:wizarding_world_explorer/services/api_service.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';

class SpellsPage extends ConsumerStatefulWidget {
  const SpellsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SpellsPage> createState() => _SpellsPageState();
}

class _SpellsPageState extends ConsumerState<SpellsPage> {
  @override
  Widget build(BuildContext context) {
    // Watching the searchQueryProvider to get the current search query
    final searchQuery = ref.watch(searchQueryProvider);

    // Using a Consumer to listen for changes to the ApiService instance
    return Consumer(builder: (context, ref, child) {
      final apiService = ref.watch(apiServiceProvider);

      // Using FutureBuilder to handle asynchronous data loading
      // Passing the searchQuery to fetchData
      return FutureBuilder(
        future: apiService.fetchData<Spell>(ApiEndpoints.spells,
            queryParams: searchQuery),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // Displaying an error message if data loading fails
              return Text('Error: ${snapshot.error}');
            }

            // Extracting the list of elixirs from the snapshot data
            final spells = snapshot.data as List<Spell>;

            // Building a ListView of ListTile widgets
            return ListView.builder(
              itemCount: spells.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(spells[index].name),
                );
              },
            );
          } else {
            // Displaying a progress indicator while data is loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    });
  }
}
