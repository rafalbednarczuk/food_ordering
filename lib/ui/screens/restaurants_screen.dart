import 'package:flutter/material.dart';
import 'package:food_ordering/bloc/restaurants/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantsScreen extends StatefulWidget {
  @override
  _RestaurantsScreenState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  RestaurantsBloc _restaurantsBloc;

  @override
  void initState() {
    super.initState();
    _restaurantsBloc = RestaurantsBloc();
  }

  @override
  void dispose() {
    _restaurantsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<RestaurantsBloc, RestaurantsState>(
            bloc: _restaurantsBloc,
            builder: (context, state) {
              if (state.loadingRestaurants) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: state.restaurants.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            _restaurantsBloc.add(ClickRestaurantCard(
                                state.restaurants[index].id));
                          },
                          child:
                              Card(child: Text(state.restaurants[index].name)),
                        ),
                      ));
            }));
  }
}
