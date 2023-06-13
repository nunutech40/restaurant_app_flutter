import 'package:flutter/material.dart';
import 'package:restaurant_app_flutter/model/resaturant.dart';
import 'package:restaurant_app_flutter/pages/restauran_detail_screen.dart';
import 'package:restaurant_app_flutter/pages/restauran_list_screen.dart';
import 'package:restaurant_app_flutter/pages/restauran_page.dart';
import 'package:restaurant_app_flutter/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(elevation: 0),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))))),
      initialRoute: RestauranPage.routeName,
      routes: {
        RestauranPage.routeName: (context) => const RestauranPage(),
        RestauranDetailScreen.routeName: (context) => RestauranDetailScreen(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}
