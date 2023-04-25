

import 'package:get_it/get_it.dart';
import 'package:weather_app/feature/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/feature/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/feature/weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_app/feature/weather/presentation/manager/bloc/home_bloc.dart';
import 'feature/weather/data/data_sources/network/weather_api.dart';

GetIt locator = GetIt.instance;


setUp() async{

  //weatherApi
  locator.registerSingleton<WeatherApi>(WeatherApi());

  //repositories
  locator.registerSingleton<WeatherRepository>(WeatherRepositoryImp(locator()));


  //get Current Weather
  locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator()));


  //Home bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
}