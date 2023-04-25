import '../entities/current_weather_entity.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;
  GetCurrentWeatherUseCase(this.weatherRepository);

  Future<CurrentWeatherEntity> call(String params) async {
    return await weatherRepository.getCurrentCityWeather(params);
  }
}
