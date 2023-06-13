import 'package:flutter/material.dart';
import 'package:restaurant_app_flutter/pages/restauran_list_screen.dart';

class RestauranPage extends StatelessWidget {
  static const routeName = '/restauran_page';
  const RestauranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RestauranListScreen(),
    );
  }
}
