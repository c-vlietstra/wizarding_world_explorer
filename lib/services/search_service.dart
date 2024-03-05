import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/providers/search_query_provider.dart';

final searchServiceProvider = Provider<SearchService>((ref) {
  return SearchService(ref);
});

class SearchService {
  final Ref ref;

  SearchService(this.ref);

  void updateSearchQuery(Map<String, String> queryParams) {
    ref.read(searchQueryProvider.notifier).state = queryParams;
  }

  void resetSearchQuery() {
    ref.read(searchQueryProvider.notifier).state = {};
  }
}