part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class CwEvent extends HomeEvent {
  String cityName;
  CwEvent(this.cityName);

  @override
  List<Object?> get props => [cityName];
}

class DailyEvent extends HomeEvent {
  final double lat;
  final double long;
  DailyEvent({required this.lat,required this.long});

  @override
  List<Object?> get props => [];
}

class HourlyEvent extends HomeEvent {
  HourlyEvent();

  @override
  List<Object?> get props => [];
}
