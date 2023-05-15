import 'package:dartz/dartz.dart';
import 'package:temperature/core/error/exceptions.dart';
import 'package:temperature/core/error/failures.dart';
import 'package:temperature/features/temperature/data/datasources/weather-datasource.dart';
import 'package:temperature/features/temperature/domain/entities/location_entity.dart';
import 'package:temperature/features/temperature/domain/entities/weather_entity.dart';
import 'package:temperature/features/temperature/domain/repositories/weather_repository.dart';

class WeatherRepositoryImplementation implements IWeatherRepository{

  final IWeatherDataSource datasource;

  WeatherRepositoryImplementation(this.datasource);
    
  @override
  Future<Either<Failure, Weather>> getLocationWeather(Location location) async {
    try {
      final result = await datasource.getLocationWeather(location);      
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(erroCodigo: 'Falha ao obter os dados do clima', erroDescricao:  e.toString()));
    }
  }  
  
  @override
  Future<Either<Failure, Weather>> getCityWeather(String cityName) async {
    try {
      final result = await datasource.getCityWeather(cityName);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } 
  }

}
