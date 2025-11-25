import 'package:flutter/material.dart';

class ReviewRating extends StatefulWidget {
  final void Function(int value) onRatingSelected;
  const ReviewRating({super.key, required this.onRatingSelected});

  @override
  State<ReviewRating> createState() => _ReviewRatingState();
}

class _ReviewRatingState extends State<ReviewRating> {
  int rating = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            setState(() {
              rating = index + 1;
            });
            widget.onRatingSelected(rating);
          },
        );
      }),
    );
  }
}
