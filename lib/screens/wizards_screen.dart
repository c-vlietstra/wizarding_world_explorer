import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/models/wizard.dart';
import 'package:wizarding_world_explorer/providers/search_query_provider.dart';
import 'package:wizarding_world_explorer/services/api_service.dart';
import 'package:wizarding_world_explorer/styles/card_subtitle_style.dart';
import 'package:wizarding_world_explorer/styles/card_title_style.dart';
import 'package:wizarding_world_explorer/styles/more_text_style.dart';
import 'package:wizarding_world_explorer/styles/more_text_title.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';
import 'package:wizarding_world_explorer/widgets/animated_list_tile.dart';

class WizardsPage extends ConsumerStatefulWidget {
  const WizardsPage({super.key});

  @override
  ConsumerState<WizardsPage> createState() => _WizardsPageState();
}

class _WizardsPageState extends ConsumerState<WizardsPage> {
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
        future: apiService.fetchData<Wizard>(ApiEndpoints.wizards,
            queryParams: searchQuery),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // Displaying an error message if data loading fails
              return Text('Error: ${snapshot.error}');
            }

            // Extracting the list of elixirs from the snapshot data
            final wizards = snapshot.data as List<Wizard>;

            // Building a ListView of ListTile widgets
            return ListView.builder(
              itemCount: wizards.length,
              itemBuilder: (context, count) {
                return AnimatedExpansionTile(
                  title: Text(
                    wizards[count].lastName,
                    style: cardTitleStyle(),
                  ),
                  subtitle: Text(
                    wizards[count].firstName ?? ' ',
                    style: cardSubtitleStyle(),
                  ),
                  animatedIcon: AnimatedIcons.list_view,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        'Elixirs',
                        style: moreTextTitle(),
                      ),
                    ),
                    SizedBox(
                      height: 42.00 * wizards[count].elixirs.length,
                      child: ListView.builder(
                        itemCount: wizards[count].elixirs.length,
                        itemBuilder: ((context, index) => ListTile(
                              title: Text(
                                wizards[count].elixirs[index].name,
                                style: moreTextStyle(),
                              ),
                            )),
                      ),
                    )
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
