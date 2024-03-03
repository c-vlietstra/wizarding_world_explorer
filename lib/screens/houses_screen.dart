import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/models/house.dart';
import 'package:wizarding_world_explorer/services/api_service.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';
import 'package:wizarding_world_explorer/widgets/houses_list_card.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({super.key});

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final apiService = ref.watch(apiServiceProvider);

      return FutureBuilder(
          future: apiService.fetchData<House>(ApiEndpoints.houses),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              // Assuming the data is a list of House objects
              final houses = snapshot.data as List<House>;

              return ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  return HousesListCard(
                    houses: houses,
                    index: index,
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          });
    });
  }
}