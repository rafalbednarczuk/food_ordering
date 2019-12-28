import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering/bloc/user_bloc/bloc.dart';
import 'package:food_ordering/logger_bloc_delegate.dart';
import 'package:food_ordering/ui/screens/splash_screen.dart';
import 'package:bloc/bloc.dart';

void main() {
  BlocSupervisor.delegate = LoggerBlocDelegate();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
    ),
  ], child: MaterialApp(home: SplashScreen())));
}
