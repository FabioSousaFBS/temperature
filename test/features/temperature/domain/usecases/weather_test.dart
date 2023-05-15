import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temperature/core/error/failures.dart';
import 'package:temperature/features/temperature/domain/entities/weather_entity.dart';
import 'package:temperature/features/temperature/domain/repositories/weather_repository.dart';
import 'package:temperature/features/temperature/domain/usecases/interfaces/weather_interface.dart';
import 'package:temperature/features/temperature/domain/usecases/weather_usecase.dart';

import '../../../../mocks/weather_city_mock.dart';
import '../../../../mocks/weather_entity_mock.dart';


class MockWeatherRepository extends Mock implements IWeatherRepository{}
class MockWeatherUseCase extends Mock implements IUsecasesWeather{}

void main(){

  late WeatherUsecase usecase;
  late IWeatherRepository mockWeatherRepository;
  late IUsecasesWeather mockWeatherUseCase;

  setUp((){
    mockWeatherRepository = MockWeatherRepository();
    usecase = WeatherUsecase(mockWeatherRepository);

    mockWeatherUseCase = MockWeatherUseCase();
    
  });


  test('Should get object weather for given a city name', 
  () async {
  
      when(() => mockWeatherRepository.getCityWeather(tCityName))
        .thenAnswer((_) async => Right(tWeather));
      
      final result = await usecase.getCityWeather(tCityName);
      
      expect(result, Right(tWeather));
      
      verify(() => mockWeatherRepository.getCityWeather(tCityName)).called(1);
      
      verifyNoMoreInteractions(mockWeatherRepository);         
  });


  test('Should return a failure when do not succeed', () async {

    when(() => mockWeatherRepository.getCityWeather(tCityName))
        .thenAnswer((_) async => Left<Failure, Weather>(ServerFailure()) );
      
      final result = await usecase.getCityWeather(tCityName);
      
      expect(result, Left(ServerFailure()));
      
      verify(() => mockWeatherRepository.getCityWeather(tCityName)).called(1);
      
      verifyNoMoreInteractions(mockWeatherRepository);    

  } );

  final tCondition = 301;
  final resultExpect = '🌧';

  test('Should return a string for given a int condition', (){

    when(() => mockWeatherUseCase.getWeatherIcon(tCondition)).thenReturn(resultExpect);

    final result = usecase.getWeatherIcon(tCondition);

    expect(result, resultExpect);

  });

  final tTemperature = 23;
  final tMessageExpect = 'Time for shorts and 👕';

  test('Should return a string of message for given a temperature', (){

    when(() => mockWeatherUseCase.getMessage(tTemperature)).thenReturn(tMessageExpect);

    final result = usecase.getMessage(tTemperature);

    expect(result, tMessageExpect);

  });
  

}


