import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/models/house.dart';
import 'package:wizarding_world_explorer/services/api_service.dart';
import 'package:wizarding_world_explorer/utils/constants.dart';
import 'package:wizarding_world_explorer/widgets/houses_list_card.dart';

// Widget for displaying a list of houses from the API
class HousesPage extends StatefulWidget {
  const HousesPage({Key? key}) : super(key: key);

  @override
  State<HousesPage> createState() => _HousesPageState();
}

// State class for HousesPage
class _HousesPageState extends State<HousesPage> {
  @override
  Widget build(BuildContext context) {
    // Using a Consumer to listen for changes to the ApiService instance
    return Consumer(builder: (context, ref, child) {
      final apiService = ref.watch(apiServiceProvider);

      // Using FutureBuilder to handle asynchronous data loading
      return FutureBuilder(
          future: apiService.fetchData<House>(ApiEndpoints.houses),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // Displaying an error message if data loading fails
                return Text('Error: ${snapshot.error}');
              }

              // Extracting the list of houses from the snapshot data
              final houses = snapshot.data as List<House>;

              // Building a ListView of HousesListCard widgets
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
              // Displaying a progress indicator while data is loading
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }
}
