import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/models/ingredient.dart';
import 'package:wizarding_world_explorer/providers/search_query_provider.dart';
import 'package:wizarding_world_explorer/services/api_service.dart';
import 'package:wizarding_world_explorer/styles/card_title_style.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';

class IngredientsPage extends ConsumerStatefulWidget {
  const IngredientsPage({super.key});

  @override
  ConsumerState<IngredientsPage> createState() => _IngredientsPageState();
}

class _IngredientsPageState extends ConsumerState<IngredientsPage> {
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
        future: apiService.fetchData<Ingredient>(ApiEndpoints.ingredients,
            queryParams: searchQuery),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // Displaying an error message if data loading fails
              return Text('Error: ${snapshot.error}');
            }

            // Extracting the list of elixirs from the snapshot data
            final ingredients = snapshot.data as List<Ingredient>;

            // Building a ListView of ListTile widgets
            return ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      ingredients[index].name,
                      style: cardTitleStyle(),
                    ),
                  ),
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
