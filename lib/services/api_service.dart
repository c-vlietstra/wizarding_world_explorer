import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:wizarding_world_explorer/models/model.dart';
import 'dart:convert';
import 'package:wizarding_world_explorer/utils/constants.dart';

/// Provider for the ApiService instance.
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  final String _baseUrl = baseUrl;

  /// Fetches data from the specified [endpoint].
  ///
  /// If [id] is provided, fetches a single item. Otherwise, fetches a collection.
  ///
  /// Usage:
  ///
  /// ```dart
  /// final apiService = ref.read(apiServiceProvider);
  /// final data = await apiService.fetchData<MyModel>(ApiEndpoints.myEndpoint, 'id');
  /// ```
  ///
  /// The [endpoint] parameter should be one of the values from the [ApiEndpoints] enum.
  /// The [id] parameter is optional and should be used when fetching a single item.
  /// Returns a list of [MyModel] instances if [isCollection] is true, or a single [MyModel] instance otherwise.
  Future<dynamic> fetchData<T extends Model>(ApiEndpoints endpoint, [String? id]) async {
    final endpointUrl = '$_baseUrl/${endpoint.url(id)}';
    try {
      final response = await http.get(Uri.parse(endpointUrl));

      if (response.statusCode == 200) {
        final data = _validateResponse(response.body, endpoint.isCollection);
        final fromJson = endpointToModel[endpoint] as T Function(Map<String, dynamic>);

        if (endpoint.isCollection) {
          return List<T>.from(data.map((item) => fromJson(item)));
        } else {
          return fromJson(data);
        }
      } else if (response.statusCode == 404) {
        throw Exception('Resource not found: $endpointUrl');
      } else {
        throw Exception('Failed to load data from $endpointUrl: ${response.statusCode} ${response.body}');
      }
    } on SocketException {
      throw Exception('Failed to connect to the server. Please check your internet connection and try again.');
    } on FormatException {
      throw Exception('Failed to parse response. Please try again later.');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}

/// Validates the [responseBody] based on the [isCollection] flag.
dynamic _validateResponse(String responseBody, bool isCollection) {
  final data = json.decode(responseBody);
  if (isCollection) {
    if (data is! List) {
      throw Exception('Expected a list but received: $data');
    }
  } else {
    if (data is! Map) {
      throw Exception('Expected a map but received: $data');
    }
    // Add additional validation checks for required keys if needed
  }
  return data;
}
