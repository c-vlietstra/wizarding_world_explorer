import 'package:flutter/material.dart';
import 'package:wizarding_world_explorer/models/house.dart';
import 'package:wizarding_world_explorer/styles/card_subtitle_style.dart';
import 'package:wizarding_world_explorer/styles/card_title_style.dart';

class HousesListCard extends StatelessWidget {
  const HousesListCard({
    super.key,
    required this.houses,
    required this.index,
  });

  final List<House> houses;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              houses[index].name,
              style: cardTitleStyle(),
            ),
            subtitle: Text(
              'Founder: ${houses[index].founder}',
              style: cardSubtitleStyle(),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
            child: Image.asset('assets/images/gryffindor_house_emblem.webp'),
          )
        ],
      ),
    );
  }
}
