import 'package:flutter/material.dart';
import 'package:restaurant_app_flutter/widgets/CustomScaffold.dart';

import '../model/resaturant.dart';

class RestauranDetailScreen extends StatelessWidget {
  static const routeName = '/restauran_detail';
  const RestauranDetailScreen({Key? key, required this.restaurant})
      : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: restaurant.pictureId,
            child: Image.network(restaurant.pictureId),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                  child: Row(
                    children: [
                      Text('Location ${restaurant.city}',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        'Rating ${restaurant.rating}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tentang restaurant ini",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  restaurant.description,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          Container(
            height: 100, // Adjust the height as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Foods Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.menus?.foods.length,
                    itemBuilder: (context, index) {
                      final food = restaurant.menus?.foods[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text(food?.name ?? ""),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100, // Adjust the height as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Drinks Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.menus?.drinks.length,
                    itemBuilder: (context, index) {
                      final drink = restaurant.menus?.drinks[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text(drink?.name ?? ""),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
    ;
  }
}
