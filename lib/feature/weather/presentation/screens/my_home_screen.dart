import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/weather/presentation/manager/bloc/home_bloc.dart';
import 'package:weather_app/feature/weather/presentation/screens/search_screen.dart';
import 'package:weather_app/service_locator.dart';
import '../widgets/current_weather_details.dart';
import '../widgets/custom_drawer.dart';


class MyHomeScreen extends StatelessWidget {
  String cityName ;
  MyHomeScreen({Key? key,this.cityName=''}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>()..add(CwEvent(cityName)),
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFF263238),
            drawer: CustomDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              leading: IconButton(
                  onPressed: () {
                    // Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu)),
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => SearchScreen())
                        );
                      },
                      child: Icon(Icons.search, color: Colors.white,)),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CurrentWeatherDetails(),
                ],
              ),
            ),
          )),
    );
  }
}
