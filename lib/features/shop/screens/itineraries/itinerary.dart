import 'package:explore_ease/common/widgets/appbar/appbar.dart';
import 'package:explore_ease/features/shop/screens/itineraries/widgets/itinerary_list.dart';
import 'package:explore_ease/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Appbar
      appBar: EEAppBar(title: Text('My Itineraries',style: Theme.of(context).textTheme.headlineSmall),showBackArrow: true),
      body: const Padding(
          padding: EdgeInsets.all(EESizes.defaultSpace),


        ///orders
        child: EEItineraryListItems(),
      ),
    );
  }
}
