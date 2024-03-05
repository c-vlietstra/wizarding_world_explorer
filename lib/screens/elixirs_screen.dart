import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/models/elixir.dart';
import 'package:wizarding_world_explorer/providers/search_query_provider.dart';
import 'package:wizarding_world_explorer/services/api_service.dart';
import 'package:wizarding_world_explorer/styles/card_subtitle_style.dart';
import 'package:wizarding_world_explorer/styles/card_title_style.dart';
import 'package:wizarding_world_explorer/styles/more_text_style.dart';
import 'package:wizarding_world_explorer/styles/more_text_title.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';
import 'package:wizarding_world_explorer/widgets/animated_list_tile.dart';

class ElixirsPage extends ConsumerStatefulWidget {
  const ElixirsPage({super.key});

  @override
  ConsumerState<ElixirsPage> createState() => _ElixirsPageState();
}

class _ElixirsPageState extends ConsumerState<ElixirsPage> {
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
        future: apiService.fetchData<Elixir>(ApiEndpoints.elixirs,
            queryParams: searchQuery),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // Displaying an error message if data loading fails
              return Text('Error: ${snapshot.error}');
            }

            // Extracting the list of elixirs from the snapshot data
            final elixirs = snapshot.data as List<Elixir>;

            // Building a ListView of ListTile widgets
            return ListView.builder(
              itemCount: elixirs.length,
              itemBuilder: (context, index) {
                return AnimatedExpansionTile(
                  animatedIcon: AnimatedIcons.list_view,
                  title: Text(
                    elixirs[index].name,
                    style: cardTitleStyle(),
                  ),
                  subtitle: Text(
                    elixirs[index].inventorsAsString,
                    style: cardSubtitleStyle(),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        'Ingredients',
                        style: moreTextTitle(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        elixirs[index].ingredientsAsString,
                        style: moreTextStyle(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        'Effects',
                        style: moreTextTitle(),
                      ),
                    ),
                    Text(
                      elixirs[index].effect ?? 'No Recorded Effects',
                      style: moreTextStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        'Side Effects',
                        style: moreTextTitle(),
                      ),
                    ),
                    Text(
                      elixirs[index].sideEffects ?? 'No Recorded Side Effects',
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
