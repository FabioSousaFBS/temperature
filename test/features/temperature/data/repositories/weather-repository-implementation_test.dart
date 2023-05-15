import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temperature/core/error/exceptions.dart';
import 'package:temperature/core/error/failures.dart';
import 'package:temperature/features/temperature/data/datasources/weather-datasource.dart';
import 'package:temperature/features/temperature/data/models/weather-model.dart';
import 'package:temperature/features/temperature/data/repositories/weather-repository-implementation.dart';

class MockIWeatherDatasource extends Mock implements IWeatherDataSource{}

void main(){

  late IWeatherDataSource dataSource;
  late WeatherRepositoryImplementation repository;

  setUp((){
    dataSource = MockIWeatherDatasource();
    repository = WeatherRepositoryImplementation(dataSource);    
  });

  const tCityName = 'Garça';
  final tWeatherModel = WeatherModel(id: 0, main: 'rain', description: 'raining', icon: 123, cityName: 'Garça', temperature: 20);
  
  test('Should return weather model when calls datasource', () async {

    when(() => dataSource.getCityWeather(tCityName))
        .thenAnswer((_) async => tWeatherModel);    
      

    final result = await repository.getCityWeather(tCityName);

    expect(result, Right(tWeatherModel));
    verify(() => dataSource.getCityWeather(tCityName)).called(1);

  });


  test('Should return a server failure when the call returns an exception', () async {

    when(() => dataSource.getCityWeather(tCityName))
        .thenThrow(ServerException()) ;

    final result = await repository.getCityWeather(tCityName);

    expect(result, Left(ServerFailure()));

    verify(() => dataSource.getCityWeather(tCityName)).called(1);

  });


}

