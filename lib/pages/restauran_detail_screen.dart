import 'package:flutter/material.dart';

import '../model/resaturant.dart';

class RestauranDetailScreen extends StatelessWidget {
  static const routeName = '/restauran_detail';
  const RestauranDetailScreen({Key? key, required this.restaurant})
      : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: restaurant.pictureId,
            child: Image.network(restaurant.pictureId),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Text(restaurant.description),
              const Divider(
                color: Colors.grey,
              ),
              Text(
                restaurant.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Text(
                '${restaurant.rating}',
                style: const TextStyle(fontSize: 16),
              ),
            ]),
          )
        ]),
      ),
    );
    ;
  }
}
