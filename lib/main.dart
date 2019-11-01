import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering/ui/splash_screen/splash_screen.dart';
import 'package:food_ordering/bloc/user_bloc/user_bloc.dart';

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider<UserBloc>(
        builder: (context) => UserBloc(),
      ),
    ], child: MaterialApp(home: SplashScreen())));
