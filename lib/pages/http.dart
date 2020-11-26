
import 'package:dio/dio.dart';

class Http {
  static final Http _instance = Http._internal();

  static Http get instance => _instance;

  final _dio = Dio();

  factory Http() {
    return _instance;
  }

  Http._internal() {
    _dio.options.connectTimeout = 100000;
    _dio.options.receiveTimeout = 100000;
  }

  Future<Response> getListStore() async {
    return _dio.get("https://truyencotichaudio.com/api/getListStoryHomeUp");
  }
}
