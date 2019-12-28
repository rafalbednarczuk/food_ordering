import 'dart:async';

import 'package:food_ordering/bloc/restaurants/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:food_ordering/model/restaurant/restaurant.dart';
import 'package:food_ordering/repository/restaurants_repository.dart';

class _UpdateRestaurants extends RestaurantsEvent {
  final List<Restaurant> restaurants;

  _UpdateRestaurants(this.restaurants);
}

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final RestaurantsRepository _restaurantsRepository;
  final List<StreamSubscription> _ss;

  RestaurantsBloc({RestaurantsRepository restaurantsRepository})
      : _ss = [],
        _restaurantsRepository =
            restaurantsRepository ?? RestaurantsRepository() {
    _ss.add(_listenToRestaurants());
  }

  @override
  Future<void> close() async {
    _ss.forEach((ss) => ss.cancel());
    await super.close();
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    throw error;
  }

  @override
  RestaurantsState get initialState => RestaurantsState.initial();

  StreamSubscription _listenToRestaurants() {
    return _restaurantsRepository.getRestaurants().listen((restaurants) {
      this.add(_UpdateRestaurants(restaurants));
    });
  }

  @override
  Stream<RestaurantsState> mapEventToState(RestaurantsEvent event) async* {
    if (event is _UpdateRestaurants) {
      yield state.copyWith(
          restaurants: event.restaurants, loadingRestaurants: false);
    }
  }
}
