import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_detail_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_detail_state.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_detail_event.dart';
import 'package:easy_travel/features/home/presentation/widgets/review_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showReviewDialog(context: context);
        },
        child: const Icon(Icons.add_comment),
      ),
      body: BlocBuilder<DestinationDetailBloc, DestinationDetailState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.failure:
              return Center(child: Text(state.message ?? 'Unknown error'));
            case Status.success:
              final destination = state.destination!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
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
                          context.read<DestinationDetailBloc>().add(
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
                  Text(
                    destination.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.reviews.length,
                        itemBuilder: (context, index) {
                          final review = state.reviews[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => Icon(
                                      index < review.rating
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: index < review.rating
                                          ? Theme.of(context).colorScheme.primary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                                Text(review.comment),
                                Text(
                                  review.userName,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void _showReviewDialog({required BuildContext context}) {
    int rating = 0;
    String comment = '';

    showDialog(
      context: context,
      builder: (_) {
        return BlocBuilder<DestinationDetailBloc, DestinationDetailState>(
          builder: (context, state) => AlertDialog(
            title: const Text('Leave a review'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) => comment = value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your review',
                    ),
                    maxLines: 3,
                  ),
                  ReviewRating(onRatingSelected: (value) => rating = value),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.read<DestinationDetailBloc>().add(
                    AddReview(
                      id: state.destination!.id,
                      comment: comment,
                      rating: rating,
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }
}
