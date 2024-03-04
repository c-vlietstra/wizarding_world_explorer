import 'package:wizarding_world_explorer/utils/constants.dart';

String getTraitImagePath(String traitName) {
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
      return 'assets/images/default.png'; // Default image if the trait name doesn't match
  }
}
