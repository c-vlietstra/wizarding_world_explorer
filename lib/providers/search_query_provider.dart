// Importing the 'flutter_riverpod' package to use the Riverpod state management library.
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Defining a global provider for managing the search query state.
// This provider holds a state of type 'Map<String, String>' which represents the search query parameters.
// The initial state is an empty map.
final searchQueryProvider = StateProvider<Map<String, String>>((ref) => {});
