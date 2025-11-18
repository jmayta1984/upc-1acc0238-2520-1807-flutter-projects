import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_detail_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationDetailBloc extends Bloc<DestinationDetailEvent, DestinationDetailState> {
  final DestinationRepository repository;
  DestinationDetailBloc({required this.repository}):super(DestinationDetailState()) {
    
  }
  
}