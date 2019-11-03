import 'package:dio/dio.dart';
import 'package:food_ordering/request/login_request/login_request.dart';

class ApiProvider {
  static ApiProvider _provider;

  final Dio _dio;

  factory ApiProvider({Dio dio}) {
    if (_provider == null) {
      _provider = ApiProvider._init(dio);
    }
    return _provider;
  }

  ApiProvider._init(Dio dio) : _dio = dio ?? Dio();

  Future<Response> login(email, password) async {
    final loginRequest = LoginRequest(email, password);
    return response(_dio.post("login", data: loginRequest.toJson()));
  }

  Future<Response> response(Future<Response> response) async {
    try {
      return await response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
