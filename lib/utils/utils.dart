import 'package:flutter/material.dart';

class AppStrings {
  static const username = 'Username';
  static const email = 'Email';
  static const password = 'Password';
  static const noAccount = "Don't have an account? ";
  static const yesAccount = "Already have an account? ";
  static const signUp = "Sign Up";
  static const forgotPassword = 'Forgot your password?';
  static const login = 'Login';
  static const loginFacebook = 'Sign up with Facebook';
}

class AppColors {
  static const login = 0xffff2d55;
}

class AppTextStyles {
  static const loginScreenDefault = TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'SFUIDisplay',
  );
}

const contentDefaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 24.0);
