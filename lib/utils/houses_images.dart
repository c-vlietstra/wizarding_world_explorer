import 'package:wizarding_world_explorer/utils/constants.dart';

// This file contains a function to retrieve the image path associated with a specific house name.
// Usage:
// Import this file into your Dart file.
// Call the getHouseImagePath function with the house name as a parameter.
// Example: String imagePath = getHouseImagePath('Gryffindor');

// Function to get the image path for a given house name.
String getHouseImagePath(String houseName) {
  // Convert the house name to lowercase to ensure case-insensitive matching.
  switch (houseName.toLowerCase()) {
    case 'gryffindor':
      return houseImages[HouseName.gryffindor]!;
    case 'hufflepuff':
      return houseImages[HouseName.hufflepuff]!;
    case 'ravenclaw':
      return houseImages[HouseName.ravenclaw]!;
    case 'slytherin':
      return houseImages[HouseName.slytherin]!;
    default:
      // Return a default image path if the house name doesn't match any case.
      return 'assets/images/houses/default_house.webp';
  }
}