

import '../entities/current_weather_entity.dart';

abstract class WeatherRepository {

Future<CurrentWeatherEntity> getCurrentCityWeather(String cityName);

}