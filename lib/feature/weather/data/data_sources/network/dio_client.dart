import 'package:dio/dio.dart';
import 'package:weather_app/feature/weather/data/data_sources/network/api_constants.dart';

class DioClient {
  //dio instance
  final Dio _dio = Dio();

  DioClient() {
    _dio
      ..options.baseUrl = ApiConstants.baseUrl;
  }

  //Get------------------------------------------------------
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
