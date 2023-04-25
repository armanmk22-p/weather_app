import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_cases/get_current_weather_usecase.dart';
import 'cw_status.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase ;
  HomeBloc(this.getCurrentWeatherUseCase)
      : super(
          HomeState(
              cwStatus: CwLoading(),
             ),
        ) {
    on<CwEvent>((_getCurrentCityWeather));
  }

  //get current by city
  Future<void> _getCurrentCityWeather(
      CwEvent event, Emitter<HomeState> emit) async {
     emit(state.copyWith(newCwStatus: CwLoading()));
    try {
      final currentCityEntity =
          await getCurrentWeatherUseCase.call(event.cityName);
      emit(
        state.copyWith(newCwStatus: CwCompleted(currentCityEntity)),
      );
    } catch (e) {
      emit(state.copyWith(newCwStatus: CwError(e.toString())));
    }
  }

}
