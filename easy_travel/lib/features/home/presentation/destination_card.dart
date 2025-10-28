import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            destination.posterPath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Text(
            destination.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(destination.overview),
        ],
      ),
    );
  }
}
