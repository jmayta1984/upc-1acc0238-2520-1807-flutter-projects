import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/constants/api_constants.dart';
import 'package:easy_travel/core/enums/category_type.dart';
import 'package:easy_travel/features/home/data/destination_dto.dart';
import 'package:http/http.dart' as http;

class DestinationService {
  Future<List<DestinationDto>> getDestinations({required String category}) async {
    try {
      final Uri uri = Uri.parse(ApiConstants.baseUrl).replace(
        path: ApiConstants.destinationsEndpoint,
        queryParameters: CategoryType.all.label == category
            ? null
            : {'type': category},
      );
      final response = await http.get(uri);

      if (response.statusCode == HttpStatus.ok) {
        List maps = jsonDecode(response.body)['results'];

        return maps.map((json) => DestinationDto.fromJson(json)).toList();
      }

      throw ('Unexpected error: ${response.statusCode}');
    } catch (e) {
      throw ('Unexpected error: $e');
    }
  }
}
