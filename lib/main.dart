import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
     create: (context) {
        return WeatherCubit(WeatherService());
      },
    child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
  builder: (context, state) {
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: state is !WeatherSuccess ?  Colors.blue : state.weatherModel.getThemeColor()  ,
      ),
      home: const HomePage(),
    );
  },
);
  }
}
