abstract class UserEvent {}

class Login extends UserEvent {
  final String email;
  final String password;

  Login(this.email, this.password);
}

class Logout extends UserEvent {}
