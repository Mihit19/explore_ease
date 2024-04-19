import 'package:explore_ease/features/shop/screens/landmark_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class EEOverallProgressRating extends StatelessWidget {
  const EEOverallProgressRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              EERatingProgressIndicator(text: '5',value: 1.0),
              EERatingProgressIndicator(text: '4',value: 0.8),
              EERatingProgressIndicator(text: '3',value: 0.6),
              EERatingProgressIndicator(text: '2',value: 0.4),
              EERatingProgressIndicator(text: '1',value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
