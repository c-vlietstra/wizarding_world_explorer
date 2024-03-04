import 'package:wizarding_world_explorer/utils/constants.dart';

String getHouseImagePath(String houseName) {
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
      return 'assets/images/houses/default_house.webp'; // Default image if the house name doesn't match
  }
}