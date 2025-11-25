import 'dart:io';

import 'package:easy_travel/core/constants/api_constants.dart';
import 'package:easy_travel/core/storage/token_storage.dart';
import 'package:easy_travel/features/home/domain/review.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewService {
  Future<List<Review>> getReviewsByDestination(int id) async {
    final Uri uri = Uri.parse(
      ApiConstants.baseUrl,
    ).replace(path: '${ApiConstants.reviewsEndpoint}/$id');
    try {
      final response = await http.get(uri);

      if (response.statusCode == HttpStatus.ok) {
        List maps = jsonDecode(response.body);
        return maps.map((json) => Review.fromJson(json)).toList();
      }

      throw ('Unexpected error: ${response.statusCode}');
    } catch (e) {
      throw ('Unexpected error: $e');
    }
  }

  Future<void> addReview(int id, String comment, int rating) async {
    final Uri uri = Uri.parse(
      ApiConstants.baseUrl,
    ).replace(path: ApiConstants.reviewsEndpoint);

    try {
      final token = await TokenStorage().read();
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'destinationId': id,
          'comment': comment,
          'rating': rating,
        }),
      );

      if (response.statusCode != HttpStatus.created) {
        throw ('Failed to submit review: ${response.statusCode}');
      }
    } catch (e) {
      throw ('Unexpected error: $e');
    }
  }
}
