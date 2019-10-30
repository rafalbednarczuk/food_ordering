import 'package:food_ordering/repository/user_repository.dart';
import 'package:food_ordering/bloc/user_bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:food_ordering/model/user/user.dart';
import 'package:pedantic/pedantic.dart';

class _UpdateUser extends UserEvent {
  final User user;

  _UpdateUser(this.user);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({UserRepository userRepository})
      : _userRepository = userRepository ?? UserRepository() {
    _fetchUser();
  }

  Future _fetchUser() async {
    final user = await _userRepository.getUser();
    this.add(_UpdateUser(user));
  }

  @override
  UserState get initialState => UserState.initial();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
    if (event is _UpdateUser) {
      yield state.setUser(event.user);
    } else if (event is Login) {
      unawaited(_userRepository.login(event.email, event.password));
    } else if (event is Logout) {
      _userRepository.logout();
    }
  }
}
