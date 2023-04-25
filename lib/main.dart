import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/weather/presentation/manager/bloc/home_bloc.dart';
import 'package:weather_app/service_locator.dart';
import 'feature/weather/presentation/screens/my_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init serviceLocator
  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomeScreen(),
      ),
    );
  }
}

