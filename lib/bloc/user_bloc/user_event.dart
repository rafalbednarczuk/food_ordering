abstract class UserEvent {}

class Login extends UserEvent {
  final String username;
  final String password;

  Login(this.username, this.password);
}

class Logout extends UserEvent {}
