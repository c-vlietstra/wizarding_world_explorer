// Importing the necessary packages and providers.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/providers/search_query_provider.dart';

// Defining a provider 'searchServiceProvider' that creates an instance of 'SearchService'.
// The 'SearchService' class is responsible for managing the search query state in the application.
final searchServiceProvider = Provider<SearchService>((ref) {
  return SearchService(ref); // Passes the Riverpod 'ref' to the 'SearchService' constructor.
});

// The 'SearchService' class provides methods to update and reset the search query.
class SearchService {
  final Ref ref; // A reference to the Riverpod provider scope.

  // Constructor for the 'SearchService' class, taking a 'Ref' object as an argument.
  SearchService(this.ref);

  // Method 'updateSearchQuery' takes a map of query parameters and updates the search query state.
  void updateSearchQuery(Map<String, String> queryParams) {
    // Updates the state of the 'searchQueryProvider' with the new query parameters.
    ref.read(searchQueryProvider.notifier).state = queryParams;
  }

  // Method 'resetSearchQuery' resets the search query state to an empty map.
  void resetSearchQuery() {
    // Resets the state of the 'searchQueryProvider' to an empty map.
    ref.read(searchQueryProvider.notifier).state = {};
  }
}
