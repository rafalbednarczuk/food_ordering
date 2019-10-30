import 'package:food_ordering/model/user/user.dart';

class UserState {
  final bool loadingUser;
  final User user;

  UserState._private(this.loadingUser, this.user);

  UserState.initial()
      : loadingUser = true,
        user = null;

  UserState setUser(User user) {
    return UserState._private(false, user);
  }

  UserState.loggedOut()
      : loadingUser = false,
        user = null;
}
