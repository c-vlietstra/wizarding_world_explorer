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
  final Map<String, dynamic> _cache = {}; // Cache for storing API responses.

  /// Fetches data from the specified [endpoint] with optional [queryParams].
  ///
  /// This method first checks if the data is available in the cache. If it is,
  /// the cached data is returned. Otherwise, it makes a network request to
  /// fetch the data, caches the result, and then returns it.
  ///
  /// Usage:
  ///
  /// ```dart
  /// final apiService = ref.read(apiServiceProvider);
  /// final data = await apiService.fetchData<MyModel>(ApiEndpoints.myEndpoint, queryParams: {'name': 'value'});
  /// ```
  ///
  /// The [endpoint] parameter should be one of the values from the [ApiEndpoints] enum.
  /// The [queryParams] parameter is optional and should be used when fetching data with query parameters.
  /// Returns a list of [MyModel] instances if [isCollection] is true, or a single [MyModel] instance otherwise.
  /// 
  Future<dynamic> fetchData<T extends Model>(ApiEndpoints endpoint, {Map<String, String>? queryParams}) async {
    String endpointUrl = '$_baseUrl/${endpoint.url()}';
    if (queryParams != null && queryParams.isNotEmpty) {
      endpointUrl += '${Uri(queryParameters: queryParams)}';
    }

    // Check if the data is in the cache
    if (_cache.containsKey(endpointUrl)) {
      return _cache[endpointUrl];
    }

    try {
      final response = await http.get(Uri.parse(endpointUrl));

      if (response.statusCode == 200) {
        final data = _validateResponse(response.body, endpoint.isCollection);
        final fromJson = endpointToModel[endpoint] as T Function(Map<String, dynamic>);

        dynamic result;
        if (endpoint.isCollection) {
          result = List<T>.from(data.map((item) => fromJson(item)));
        } else {
          result = fromJson(data);
        }

        // Cache the result
        _cache[endpointUrl] = result;

        return result;
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
  }
  return data;
}