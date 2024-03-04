import 'package:flutter/material.dart';
import 'package:wizarding_world_explorer/models/house.dart';
import 'package:wizarding_world_explorer/styles/card_subtitle_style.dart';
import 'package:wizarding_world_explorer/styles/card_title_style.dart';
import 'package:wizarding_world_explorer/utils/house_heads_images.dart';
import 'package:wizarding_world_explorer/utils/houses_images.dart';
import 'package:wizarding_world_explorer/utils/traits_images.dart';

class HousesListCard extends StatelessWidget {
  const HousesListCard({
    Key? key,
    required this.houses,
    required this.index,
  }) : super(key: key);

  final List<House> houses;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              child: Image.asset(
                getHouseImagePath(
                  houses[index].name,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'House Heads:',
                style: cardTitleStyle(),
              ),
            ),
            SizedBox(
              height: 200, // Set a fixed height for the ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: houses[index].heads.length,
                itemBuilder: (context, count) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${houses[index].heads[count].firstName} ${houses[index].heads[count].lastName}',
                            style: cardSubtitleStyle(),
                          ),
                          Flexible(
                            child: Image.asset(
                              getHouseHeadImagePath(houses[index].heads[count].lastName),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'House Traits:',
                style: cardTitleStyle(),
              ),
            ),
            SizedBox(
              height: 200, // Set a fixed height for the ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: houses[index].traits.length,
                itemBuilder: (context, count) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(houses[index].traits[count].name,
                            style: cardSubtitleStyle()),
                        SizedBox(
                            height: 166,
                            child: Image.asset(
                              getTraitImagePath(houses[index].traits[count].name),
                            )),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
