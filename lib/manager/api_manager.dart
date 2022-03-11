import 'package:dio/dio.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  late Dio dio;

  ApiManager._internal() {
    dio = Dio();
    dio.options.baseUrl =
    "https://api.spacexdata.com";
  }

  Future<Response<Map<String, dynamic>>> getNextLaunch() async =>
      await dio.get<Map<String, dynamic>>("/v4/launches/next");

  Future<Response<List<dynamic>>> getUpcomingLaunches() async =>
      await dio.get<List<dynamic>>("/v4/launches/upcoming");


}