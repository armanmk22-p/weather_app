import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/feature/weather/data/data_sources/network/api_constants.dart';
import 'package:weather_app/feature/weather/data/data_sources/network/dio_client.dart';

import '../../models/current_weather_model.dart';

class WeatherApi {
  //dioClient instance variable
  final DioClient _dioClient = DioClient();

  // getCurrentCityWeatherApi
  Future<Response> getCurrentCityWeatherApi(String cityName) async {

    try {

        Position currentPosition = await getCurrentPosition();
        List<Placemark> placemarks = await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude);
        Placemark place = placemarks[0];
        var cityNamePosision = place.locality!;

      final queryParameters ={
        'q':cityName == null || cityName.isEmpty ? cityNamePosision : cityName,
        'appid':ApiConstants.appId,
        'units':'metric'
      };
      final response = await _dioClient.get(ApiConstants.baseUrl,queryParameters: queryParameters);
        return response;
    } catch (e) {
      rethrow;
    }
  }

  //get user permission
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
