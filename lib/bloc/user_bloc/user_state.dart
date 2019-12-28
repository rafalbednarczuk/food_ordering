import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ordering/model/user/user.dart';

class UserState  extends Equatable {
  final bool loadingUser;
  final User user;

  @visibleForTesting
  UserState.private(this.loadingUser, this.user);

  UserState.initial()
      : loadingUser = true,
        user = null;

  UserState setUser(User user) {
    return UserState.private(false, user);
  }

  UserState.loggedOut()
      : loadingUser = false,
        user = null;

  @override
  List<Object> get props => [loadingUser, user];
}
