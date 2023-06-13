import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus? menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) {
    final menusData = restaurant['menus'] as Map<String, dynamic>?;

    Menus? menus;
    if (menusData != null) {
      final foodsData = menusData['foods'] as List<dynamic>;
      final drinksData = menusData['drinks'] as List<dynamic>;

      final foods = foodsData.map((food) => Food.fromJson(food)).toList();
      final drinks = drinksData.map((drink) => Drink.fromJson(drink)).toList();

      menus = Menus(foods: foods, drinks: drinks);
    }

    return Restaurant(
      id: restaurant['id'] ?? '',
      name: restaurant['name'] ?? '',
      description: restaurant['description'] ?? '',
      pictureId: restaurant['pictureId'] ?? '',
      city: restaurant['city'] ?? '',
      rating: (restaurant['rating'] ?? 0.0).toDouble(),
      menus: menus,
    );
  }
}

class Menus {
  final List<Food> foods;
  final List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });
}

class Food {
  final String name;

  Food({required this.name});

  factory Food.fromJson(Map<String, dynamic> food) {
    return Food(
      name: food['name'] ?? '',
    );
  }
}

class Drink {
  final String name;

  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> drink) {
    return Drink(
      name: drink['name'] ?? '',
    );
  }
}

List<Restaurant> parseRestaurant(String jsonString) {
  final parsed = jsonDecode(jsonString);
  if (parsed is List<dynamic>) {
    return parsed.map((json) => Restaurant.fromJson(json)).toList();
  } else if (parsed is Map<String, dynamic>) {
    return [Restaurant.fromJson(parsed)];
  } else {
    throw Exception('Invalid JSON format');
  }
}
