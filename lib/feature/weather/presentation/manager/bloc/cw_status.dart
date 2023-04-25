import 'package:equatable/equatable.dart';
import 'package:weather_app/feature/weather/domain/entities/current_weather_entity.dart';

abstract class CwStatus extends Equatable {}
//CwLoading
class CwLoading extends CwStatus {
  CwLoading();

  @override
  List<Object?> get props => [];
}
//CwCompleted
class CwCompleted extends CwStatus {
  final CurrentWeatherEntity currentWeatherEntity;
  CwCompleted(this.currentWeatherEntity);

  @override
  List<Object?> get props => [currentWeatherEntity];
}

//CwError
class CwError extends CwStatus {
  final String error;

  CwError(this.error);

  @override
  List<Object?> get props => [error];
}
