
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/images.dart';
import 'package:weather_app/feature/weather/presentation/manager/bloc/cw_status.dart';
import 'package:weather_app/feature/weather/presentation/manager/bloc/home_bloc.dart';
import '../../domain/entities/current_weather_entity.dart';

class CurrentWeatherDetails extends StatefulWidget {
  const CurrentWeatherDetails({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherDetails> createState() => _CurrentWeatherDetailsState();
}

class _CurrentWeatherDetailsState extends State<CurrentWeatherDetails> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return  BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.cwStatus is CwLoading) {
          return Center(child: Padding(
            padding: const EdgeInsets.only(top: 280),
            child: SizedBox(height: 40,width: 40,child: CircularProgressIndicator(),),
          ),);
        }
        if (state.cwStatus is CwCompleted) {
          final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
          final CurrentWeatherEntity currentWeatherEntity = cwCompleted
              .currentWeatherEntity;

           print("Weather Result For test : "+ currentWeatherEntity.cityName);
                return Container(
            height: size.height,
            width: size.width,
            color: Colors.blueAccent,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 280),
              child: Center(

                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            Text(
                              currentWeatherEntity.cityName.toString(),
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          DateFormat("EEEEE ,dd ,MMM").format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              // width: MediaQuery.of(context).size.width/2.3,
                              // height: MediaQuery.of(context).size.height/2.3,
                              width: 120,
                              height: 120,
                              child: LottieBuilder.asset(
                                "${DateFormat('a').format(DateTime.now()) == "AM"? ImageAssets.evening: ImageAssets.morning}",
                                height: size.height * 0.22,
                                width: size.width * 0.4,
                              ),
                            ),
                          ),
                          SizedBox(width: 50,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(currentWeatherEntity.weatherDescription
                                    .toString(),
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                Container(
                                  height: 40,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Max : ${currentWeatherEntity.maxTemperature
                                            .toInt()}\u00B0/ Min : ${currentWeatherEntity
                                            .minTemperature.toInt()}\u00B0",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        if (state.cwStatus is CwError) {
          final CwError cwError = state.cwStatus as CwError;
          final errorMessage = cwError.error;
          return Center(child: Text(errorMessage),);
        }
        return Container();
      },
    );
  }

}
