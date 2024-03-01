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

  Future<dynamic> fetchData<T extends Model>(ApiEndpoints endpoint, [String? id]) async {
    final endpointUrl = '$_baseUrl/${endpoint.url(id)}';
    final response = await http.get(Uri.parse(endpointUrl));

    if (response.statusCode == 200) {
      final data = _validateResponse(response.body, endpoint.isCollection);
      final fromJson = endpointToModel[endpoint] as T Function(Map<String, dynamic>);

      if (endpoint.isCollection) {
        return List<T>.from(data.map((item) => fromJson(item)));
      } else {
        return fromJson(data);
      }
    } else {
      throw Exception('Failed to load data from $endpointUrl: ${response.statusCode} ${response.body}');
    }
  }
}

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