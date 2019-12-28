import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {
  final Duration delay;
  final Function(String path) getJson;

  DioMock(
      {this.delay = const Duration(milliseconds: 200),
      Function(String path) getJson})
      : getJson = getJson ?? getJsonFlutter;

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
    if (["login"].contains(path)) {
      return successful(path);
    } else {
      return error(path);
    }
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    await delayedDuration();
    if (["restaurants"].contains(path)) {
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

  static Future<String> getJsonFlutter(path) async {
    final json = await rootBundle.loadString("assets/mock/$path.json");
    return json;
  }
}
