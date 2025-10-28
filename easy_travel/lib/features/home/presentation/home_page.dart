import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/destination_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Destination> _destinations = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }


  Future<void> _loadData() async {
    List<Destination> destinations = await DestinationService().getDestinations();
    setState(() {
      _destinations = destinations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _destinations.length,
      itemBuilder: (context, index)  {
        final Destination destination = _destinations[index];
        return DestinationCard(destination: destination);
      },
    );
  }
}
