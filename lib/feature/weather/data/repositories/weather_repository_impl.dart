import 'package:dio/dio.dart';
import 'package:weather_app/feature/weather/data/data_sources/network/dio_exceptions.dart';
import 'package:weather_app/feature/weather/data/data_sources/network/weather_api.dart';
import 'package:weather_app/feature/weather/data/models/current_weather_model.dart';
import 'package:weather_app/feature/weather/domain/entities/current_weather_entity.dart';
import 'package:weather_app/feature/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImp extends WeatherRepository {
  //weatherApi instance variable
  final WeatherApi weatherApi;

  WeatherRepositoryImp(this.weatherApi);

  @override
  Future<CurrentWeatherEntity> getCurrentCityWeather(String cityName) async {
    try {
      final response = await weatherApi.getCurrentCityWeatherApi(cityName);
      return CurrentWeatherModel.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

}
