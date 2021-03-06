import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering/bloc/user_bloc/bloc.dart';
import 'package:food_ordering/ui/logo.dart';
import 'package:food_ordering/ui/screens/login_register_screen.dart';
import 'package:food_ordering/ui/screens/restaurants_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (!state.loadingUser) {
          if (state.user != null) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => RestaurantsScreen()));
          } else {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginRegisterScreen()));
          }
        }
      },
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Logo(),
        ),
      ),
    );
  }
}
