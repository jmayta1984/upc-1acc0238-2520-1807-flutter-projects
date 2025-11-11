import 'package:easy_travel/features/home/presentation/blocs/destinations_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_event.dart';
import 'package:easy_travel/shared/domain/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Hero(
                  tag: destination.id,
                  child: Image.network(
                    destination.posterPath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: SizedBox(
                      child: Container(
                        color: Theme.of(context).colorScheme.surface,
                        child: IconButton(
                          onPressed: () {
                            context.read<DestinationsBloc>().add(
                              ToggleFavorite(destination: destination),
                            );
                          },
                          icon: Icon(Icons.favorite_border),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(destination.overview, maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
