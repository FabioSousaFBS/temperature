import 'package:dartz/dartz.dart';
import 'package:temperature/core/error/failures.dart';
import 'package:temperature/features/temperature/domain/entities/weather_entity.dart';

abstract class IUsecasesWeather{

  Future<Either<Failure, Weather>> getCityWeather(String cityName);

  Future<Either<Failure, Weather>> getLocationWeather(); 

  String getWeatherIcon(int condition);

  String getMessage(int temp);

}
