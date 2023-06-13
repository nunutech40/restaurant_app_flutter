import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app_flutter/model/resaturant.dart';
import 'package:restaurant_app_flutter/pages/restauran_detail_screen.dart';

class RestauranListScreen extends StatefulWidget {
  const RestauranListScreen({Key? key}) : super(key: key);

  @override
  _RestauranListScreenState createState() => _RestauranListScreenState();
}

class _RestauranListScreenState extends State<RestauranListScreen> {
  SliverPersistentHeader _header(String text, String subText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 150,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            color: Colors.lightBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 28.0),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    subText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
      ),
    );
  }

  List<Restaurant> restaurants = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final String jsonString =
        await rootBundle.loadString('assets/local_restaurant.json');
    final parsedRestaurants = jsonDecode(jsonString)['restaurants'];
    setState(() {
      restaurants = parsedRestaurants
          .map<Restaurant>((json) => Restaurant.fromJson(json))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _header('Restaurant', 'Recommendation restauran for you!'),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final Restaurant restaurant = restaurants[index];
            return _buildRestaurantItem(context, restaurant);
          },
          childCount: restaurants.length,
        )),
      ],
    );
  }
}

Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Container(
      width: 100,
      child: Hero(
        tag: restaurant.pictureId,
        child: Image.network(
          restaurant.pictureId,
          fit: BoxFit.cover,
          errorBuilder: (ctx, error, _) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
    ),
    title: Text(restaurant.name),
    subtitle: Text(restaurant.city),
    onTap: () {
      Navigator.pushNamed(context, RestauranDetailScreen.routeName,
          arguments: restaurant);
    },
  );
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
