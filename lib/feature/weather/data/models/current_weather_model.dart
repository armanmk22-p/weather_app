import 'package:equatable/equatable.dart';

import '../../domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  const CurrentWeatherModel({
    required Coord  coord,
    required String cityName,
    required String weatherIcon,
    required String country,
    required num temperature,
    required String weatherDescription,
    required num feelsLikeTemperature,
    required num humidity,
    required num pressure,
    required num sunrise,
    required num sunset,
    required num speed,
    required num maxTemperature,
    required num minTemperature,
  }) : super(
            coord:coord,
            cityName: cityName,
            weatherIcon: weatherIcon,
            country: country,
            temperature: temperature,
            weatherDescription: weatherDescription,
            feelsLikeTemperature: feelsLikeTemperature,
            humidity: humidity,
            pressure: pressure,
            sunrise: sunrise,
            sunset: sunset,
            speed: speed,
            maxTemperature: maxTemperature,
            minTemperature: minTemperature);

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      coord: Coord.fromJson(json['coord']),
      cityName: json['name'],
      weatherIcon: json['weather'][0]['icon'],
      country: json['sys']['country'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      feelsLikeTemperature: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      speed: json['wind']['speed'],
      maxTemperature: json['main']['temp_max'],
      minTemperature: json['main']['temp_min'],
    );
  }
}


class Coord {
  Coord({
    double? lon,
    double? lat,}){
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json['lon'].toDouble();
    _lat = json['lat'].toDouble();
  }
  double? _lon;
  double? _lat;

  double? get lon => _lon;
  double? get lat => _lat;
}
