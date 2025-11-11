import 'package:easy_travel/core/enums/category_type.dart';
import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/shared/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_state.dart';
import 'package:easy_travel/features/home/presentation/widgets/destination_card.dart';
import 'package:easy_travel/features/home/presentation/pages/destination_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final _categories = CategoryType.values;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocSelector<DestinationsBloc, DestinationsState, CategoryType>(
          selector: (state) => state.selectedCategory,
          builder: (context, state) => SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return FilterChip(
                selected: state == category,
                label: Text(category.label),
                onSelected: (value) {
                  context.read<DestinationsBloc>().add(
                    GetDestinationsByCategory(category: category),
                  );
                },
              );
              },
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: _categories.length,
            ),
          ),
        ),
        Expanded(
          child: BlocSelector<DestinationsBloc, DestinationsState, (Status, List<Destination>, String?)>(
            selector:(state) => (state.status, state.destinations, state.message),
            builder: (context, state) {
              final (status, destinations, message) = state;
              switch (status) {
                case Status.loading:
                  return Center(child: CircularProgressIndicator());

                case Status.failure:
                  return Center(child: Text(message ?? 'Unknown error'));

                case Status.success:
                  return ListView.builder(
                    itemCount: destinations.length,

                    itemBuilder: (context, index) {
                      final Destination destination = destinations[index];

                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DestinationDetailPage(destination: destination),
                          ),
                        ),

                        child: DestinationCard(destination: destination),
                      );
                    },
                  );

                default:
                  return SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
