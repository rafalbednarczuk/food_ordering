import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:food_ordering/model/restaurant/restaurant.dart';

class RestaurantsState extends Equatable {
  final List<Restaurant> restaurants;
  final bool loadingRestaurants;

  @visibleForTesting
  RestaurantsState.private(this.restaurants, this.loadingRestaurants);

  RestaurantsState.initial()
      : restaurants = null,
        loadingRestaurants = true;

  RestaurantsState copyWith({
    List<Restaurant> restaurants,
    bool loadingRestaurants,
  }) {
    return RestaurantsState.private(
      restaurants ?? this.restaurants,
      loadingRestaurants ?? this.loadingRestaurants,
    );
  }

  @override
  List<Object> get props => [restaurants, loadingRestaurants];
}
