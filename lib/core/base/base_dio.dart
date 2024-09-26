import 'dart:async';
import 'dart:io';
import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:move_mate/core/base/base_model.dart';
import 'package:move_mate/core/constants/api_constants.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class TheHttpExecuter {
  String baseUrl() => ApiConstants.baseUrl + ApiConstants.port;
  TheHttpExecuter() {
    dio.interceptors.add(TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
      printRequestData: true,
      printResponseData: true,
      printRequestHeaders: true,
      printResponseHeaders: true,
      requestPen: AnsiPen()..blue(),
      responsePen: AnsiPen()..green(),
      errorPen: AnsiPen()..red(),
    )));
  }
  final dio = Dio();
  Future<dynamic> get<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Map<String, String>? queryParameters = const {},
    required T model,
  }) async {
    final response = await dio.get(
      options: Options(headers: headers),
      "${baseUrl()}$path",
      queryParameters: queryParameters,
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      default:
        throw response.data;
    }
  }



  dynamic _jsonBodyParser<T>(model, body) {
    if (body is List) {
      print(body);
      final res = body.map((e) {
        return model.fromJson(e as Map<String, dynamic>) as T;
      }).toList();
      return res;
    } else if (body is! List) {
      return model.fromJson(body);
    } else {
      return body;
    }
  }
}
