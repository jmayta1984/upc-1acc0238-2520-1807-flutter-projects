import 'package:easy_travel/features/home/presentation/blocs/destinations_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_event.dart';
import 'package:easy_travel/shared/domain/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.bottomRight,
            children: [
              Hero(
                tag: destination.id,
                child: Image.network(
                  destination.posterPath,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              IconButton(
                onPressed: () {
                  context.read<DestinationsBloc>().add(
                    ToggleFavorite(destination: destination),
                  );
                },
                icon: Icon(
                  destination.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
