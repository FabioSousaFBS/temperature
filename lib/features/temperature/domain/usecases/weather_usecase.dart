import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:temperature/core/error/failures.dart';
import 'package:temperature/features/temperature/domain/entities/location_entity.dart';
import 'package:temperature/features/temperature/domain/entities/weather_entity.dart';
import 'package:temperature/features/temperature/domain/repositories/weather_repository.dart';
import 'package:temperature/features/temperature/domain/usecases/interfaces/weather_interface.dart';

class WeatherUsecase implements IUsecasesWeather{

  final IWeatherRepository repository;

  WeatherUsecase(this.repository);
  
  @override
  Future<Either<Failure, Weather>> getLocationWeather() async {    

    Location location = Location();
    await location.getCurrentLocation();

    return await repository.getLocationWeather(location);   

  }
  
  @override
  Future<Either<Failure, Weather>> getCityWeather(String cityName) async {
    return await repository.getCityWeather(cityName);
  }
  
  @override
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
  
  @override
  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  

}
