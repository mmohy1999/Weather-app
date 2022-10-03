import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService ;
  String? cityName;

  getWeather()async{
    emit(WeatherLoading());
  try{
    WeatherModel weatherModel= await weatherService.getWeather(cityName: cityName!);
    emit(WeatherSuccess(weatherModel: weatherModel));
  }on Exception catch(e){
    debugPrint(e.toString());
    emit(WeatherFailure());
  }
  }
}
