/// Abstract base class for all models.
abstract class Model {
  Model(); // Default unnamed constructor
  factory Model.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson has not been implemented.');
  }
}