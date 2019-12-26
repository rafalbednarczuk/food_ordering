import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering/bloc/user_bloc/user_bloc.dart';
import 'package:food_ordering/ui/screens/splash_screen.dart';

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
      ),
    ], child: MaterialApp(home: SplashScreen())));
