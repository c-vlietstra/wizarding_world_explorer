import 'package:wizarding_world_explorer/utils/constants.dart';

String getHouseHeadImagePath(String lastName) {
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
      return 'assets/images/wizards/default.webp'; // Default image if the last name doesn't match
  }
}