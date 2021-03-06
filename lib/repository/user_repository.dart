import 'package:food_ordering/model/user/user.dart';
import 'package:food_ordering/provider/shared_preferences_provider.dart';
import 'package:food_ordering/provider/api_provider.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';

class UserRepository {
  final SharedPreferencesProvider _spProvider;
  final ApiProvider _apiProvider;
  final BehaviorSubject<User> _user;

  UserRepository(
      {SharedPreferencesProvider spProvider, ApiProvider apiProvider})
      : _spProvider = spProvider ?? SharedPreferencesProvider(),
        _apiProvider = apiProvider ?? ApiProvider(),
        _user = BehaviorSubject() {
    _fetchUserFromSp();
  }

  Future<void> _fetchUserFromSp() async {
    _user.add(await _spProvider.getUser());
  }

  ValueStream<User> getUser() {
    return _user.stream;
  }

  Future<void> login(String email, String password) async {
    final response = await _apiProvider.login(email, password);
    if (response?.data != null && response.statusCode == 200) {
      final user = User.fromJson(response.data);
      unawaited(_spProvider.setUser(user));
      _user.add(user);
    }
  }

  void logout() {
    _spProvider.setUser(null);
    _user.add(null);
  }
}
