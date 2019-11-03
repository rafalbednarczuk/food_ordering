import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {
  final Duration delay;

  DioMock({this.delay = const Duration(milliseconds: 200)});

  @override
  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    await delayedDuration();
    if (path == "login") {
      return successful(path);
    } else {
      return error(path);
    }
  }

  Future delayedDuration() async {
    await Future.delayed(delay);
  }

  Future<Response> successful(path) async {
    final data = jsonDecode(await getJson(path));
    return Response(
      statusCode: 200,
      data: data,
    );
  }

  Response error(path) {
    return Response(statusCode: 404);
  }

  Future<String> getJson(path) async {
    final categoryJson = File("provider/mock/$path.json");
    final json = await categoryJson.readAsString();
    return json;
  }
}
