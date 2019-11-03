import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_ordering/model/user/user.dart';
import 'package:food_ordering/provider/api_provider.dart';
import 'package:food_ordering/provider/mock/dio_mock.dart';
import 'package:food_ordering/provider/shared_preferences_provider.dart';
import 'package:food_ordering/repository/user_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:food_ordering/bloc/user_bloc/bloc.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

class SharedPreferencesProviderMock extends Mock
    implements SharedPreferencesProvider {}

main() async {
  group('user states', () {
    UserBloc userBloc;
    final userRepository = UserRepositoryMock();
    BehaviorSubject<User> subject = BehaviorSubject<User>();
    setUp(() {
      subject = BehaviorSubject<User>();
    });

    test('unlogged', () {
      when(userRepository.getUser()).thenAnswer((_) => subject.stream);
      userBloc = UserBloc(userRepository: userRepository);
      subject.add(null);
      expectLater(
          userBloc, emitsInOrder([UserState.initial(), UserState.loggedOut()]));
    });

    test('logged', () {
      final user = User("email@test.com", "api_key");
      when(userRepository.getUser()).thenAnswer((_) => subject.stream);
      userBloc = UserBloc(userRepository: userRepository);
      subject.add(user);
      expectLater(
          userBloc,
          emitsInOrder(
              [UserState.initial(), UserState.initial().setUser(user)]));
    });
  });

  group('login/logout', () {
    test('login on logged out', () async {
      final user = User.fromJson(jsonDecode(await getJson("login")));
      final spProvider = SharedPreferencesProviderMock();
      final apiProvider = ApiProvider(dio: DioMock(delay: Duration.zero));
      final userRepository =
          UserRepository(spProvider: spProvider, apiProvider: apiProvider);
      when(spProvider.getUser()).thenAnswer((_) => Future.value(null));
      final userBloc = UserBloc(userRepository: userRepository);
      userBloc.add(Login(user.email, "password"));
      unawaited(expectLater(
          userBloc,
          emitsInOrder([
            UserState.initial(),
            UserState.loggedOut(),
            UserState.loggedOut().setUser(user)
          ])));
    });
  });
}

Future<String> getJson(path) async {
  final categoryJson = File("provider/mock/$path.json");
  final json = await categoryJson.readAsString();
  return json;
}
