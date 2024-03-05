import 'package:wizarding_world_explorer/utils/constants.dart';

// This file contains a function to retrieve the image path associated with a specific trait name.
// Usage:
// Import this file into your Dart file.
// Call the getTraitImagePath function with the trait name as a parameter.
// Example: String imagePath = getTraitImagePath('courage');

// Function to get the image path for a given trait name.
String getTraitImagePath(String traitName) {
  // Convert the trait name to lowercase to ensure case-insensitive matching.
  switch (traitName.toLowerCase()) {
    case 'courage':
      return traitImages[TraitName.courage]!;
    case 'chivalary':
      return traitImages[TraitName.chivalary]!;
    case 'nerve':
      return traitImages[TraitName.nerve]!;
    case 'daring':
      return traitImages[TraitName.daring]!;
    case 'determination':
      return traitImages[TraitName.determination]!;
    case 'bravery':
      return traitImages[TraitName.bravery]!;
    case 'learning':
      return traitImages[TraitName.learning]!;
    case 'acceptance':
      return traitImages[TraitName.acceptance]!;
    case 'inteligence':
      return traitImages[TraitName.inteligence]!;
    case 'wisdom':
      return traitImages[TraitName.wisdom]!;
    case 'wit':
      return traitImages[TraitName.wit]!;
    case 'creativity':
      return traitImages[TraitName.creativity]!;
    case 'hardworking':
      return traitImages[TraitName.hardworking]!;
    case 'patience':
      return traitImages[TraitName.patience]!;
    case 'loyalty':
      return traitImages[TraitName.loyalty]!;
    case 'just':
      return traitImages[TraitName.just]!;
    case 'fairness':
      return traitImages[TraitName.fairness]!;
    case 'modesty':
      return traitImages[TraitName.modesty]!;
    case 'resourcefulness':
      return traitImages[TraitName.resourcefulness]!;
    case 'selfpreservation':
      return traitImages[TraitName.selfPreservation]!;
    case 'ambition':
      return traitImages[TraitName.ambition]!;
    case 'cunning':
      return traitImages[TraitName.cunning]!;
    case 'pride':
      return traitImages[TraitName.pride]!;
    default:
      // Return a default image path if the trait name doesn't match any case.
      return 'assets/images/traits/default.webp';
  }
}
