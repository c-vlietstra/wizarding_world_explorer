import 'package:wizarding_world_explorer/utils/constants.dart';

// This file contains a function to retrieve the image path associated with a specific house head's last name.
// Usage:
// Import this file into your Dart file.
// Call the getHouseHeadImagePath function with the last name of the house head as a parameter.
// Example: String imagePath = getHouseHeadImagePath('McGonagall');

// Function to get the image path for a given house head's last name.
String getHouseHeadImagePath(String lastName) {
  // Convert the last name to lowercase to ensure case-insensitive matching.
  switch (lastName.toLowerCase()) {
    case 'mcgonagall':
      return houseHeadImages[HouseHead.mcgonagall]!;
    case 'sprout':
      return houseHeadImages[HouseHead.sprout]!;
    case 'flitwick':
      return houseHeadImages[HouseHead.flitwick]!;
    case 'snape':
      return houseHeadImages[HouseHead.snape]!;
    case 'dumbledore':
      return houseHeadImages[HouseHead.dumbledore]!;
    case 'gryffindor':
      return houseHeadImages[HouseHead.gryffindor]!;
    case 'hufflepuff':
      return houseHeadImages[HouseHead.hufflepuff]!;
    case 'ravenclaw':
      return houseHeadImages[HouseHead.ravenclaw]!;
    case 'slytherin':
      return houseHeadImages[HouseHead.slytherin]!;
    case 'slughorn':
      return houseHeadImages[HouseHead.slughorn]!;
    case 'riddle':
      return houseHeadImages[HouseHead.riddle]!;
    default:
    // Return a default image path if the last name doesn't match any case.
      return 'assets/images/wizards/default.webp';
  }
}