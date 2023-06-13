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
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: restaurant.pictureId,
            child: Image.network(restaurant.pictureId),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  restaurant.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  '${restaurant.rating}',
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ]),
          ),
          Text(restaurant.description),
          const Divider(
            color: Colors.grey,
          ),
        ]),
      ),
    );
    ;
  }
}
