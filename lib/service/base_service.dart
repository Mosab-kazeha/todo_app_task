import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseUrl = "https://657ec9263e3f5b18946421b8.mockapi.io/todo";
  String baseTaskUrl = "tasks";
}
