import 'dart:convert';

import 'package:food_ordering/model/restaurant/restaurant.dart';
import 'package:food_ordering/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class RestaurantsRepository {
  final ApiProvider _apiProvider;
  final BehaviorSubject<List<Restaurant>> _restaurants;

  //TODO: Add restaurant fetch from spProvider
  RestaurantsRepository({ApiProvider apiProvider})
      : _apiProvider = apiProvider ?? ApiProvider(),
        _restaurants = BehaviorSubject() {
    _loadRestaurantFromApi();
  }

  Future<void> _loadRestaurantFromApi() async {
    final restaurantsResponse = await _apiProvider.getRestaurants();
    if (restaurantsResponse?.data != null) {
      final List<Restaurant> restaurants = List<Restaurant>.from(
          (restaurantsResponse.data as List)
              .map((r) => Restaurant.fromJson(r)));
      _restaurants.add(restaurants);
    }
  }

  ValueStream<List<Restaurant>> getRestaurants() {
    return _restaurants.stream;
  }
}
