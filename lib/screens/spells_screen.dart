import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/models/spell.dart';
import 'package:wizarding_world_explorer/providers/search_query_provider.dart';
import 'package:wizarding_world_explorer/services/api_service.dart';
import 'package:wizarding_world_explorer/styles/more_text_style.dart';
import 'package:wizarding_world_explorer/styles/more_text_title.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';
import 'package:wizarding_world_explorer/widgets/animated_list_tile.dart';

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
                return AnimatedExpansionTile(
                  title: Text(spells[index].name),
                  subtitle: Text(spells[index].incantation ?? 'None'),
                  animatedIcon: AnimatedIcons.list_view,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        'Effect',
                        style: moreTextTitle(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        spells[index].effect,
                        style: moreTextStyle(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        'Type',
                        style: moreTextTitle(),
                      ),
                    ),
                    Text(
                      spells[index].type,
                      style: moreTextStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        'Light',
                        style: moreTextTitle(),
                      ),
                    ),
                    Text(
                      spells[index].light,
                      style: moreTextStyle(),
                    ),
                  ],
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
