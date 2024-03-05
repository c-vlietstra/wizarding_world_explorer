/// Abstract base class for all models.
abstract class Model {
  // Default unnamed constructor for the Model class.
  Model();

  // Factory constructor for creating a Model instance from a JSON object.
  // Enforces JSON serialization in subclasses and throws an error if not implemented.
  factory Model.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson has not been implemented.');
  }
}
