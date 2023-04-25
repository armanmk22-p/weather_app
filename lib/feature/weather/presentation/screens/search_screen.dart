

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/images.dart';
import 'package:weather_app/feature/weather/presentation/manager/bloc/home_bloc.dart';
import 'package:weather_app/feature/weather/presentation/screens/my_home_screen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var Searchcontroller = TextEditingController();
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF263238),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyMedium,
                          controller: Searchcontroller,
                          onChanged: (value) {
                           setState(() {
                             cityName = value;
                           });
                            print(value);
                          },

                          onFieldSubmitted: (data) async {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => MyHomeScreen(cityName: cityName)));

                          },

                          decoration: InputDecoration(
                            hintText: 'Search City ',
                            hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 14,fontWeight: FontWeight.w500),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.blueAccent,
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => MyHomeScreen(cityName: cityName)));
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 200,),
                Text('Search By City',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30)),
                LottieBuilder.asset(
                 ImageAssets.earth ,
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
