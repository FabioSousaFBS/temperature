import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temperature/core/error/failures.dart';
import 'package:temperature/features/temperature/domain/usecases/weather_usecase.dart';



class MockWeatherUsecase extends Mock implements WeatherUsecase{}



void main(){

  //late WeatherStore weatherStore;
  late WeatherUsecase mockUsecase;

  setUp((){
    mockUsecase = MockWeatherUsecase();
    //weatherStore = WeatherStore(mockUsecase);
  });

  

  test('Should return Weather entity from usecase', () async {

    // when(() => mockUsecase.getCityWeather(any())).thenAnswer((_) async => Right(tWeather));

    // await weatherStore.getCityWeather(tCityName);

    // weatherStore.observer(
    //   onState: (state) {
    //     expect(state, tWeather);
    //     verify(() => mockUsecase.getCityWeather(tCityName)).called(1);
    //   },
    // );

  });

  final tFailure = ServerFailure();
  test('Should return Weather failure from the usecase is an error', () async {

    // when(() => mockUsecase.getCityWeather(any())).thenAnswer((_) async => Left(tFailure));

    // await weatherStore.getCityWeather(tCityName);

    // weatherStore.observer(
    //   onError: (error) {
    //     expect(error, tFailure);
    //     verify(() => mockUsecase.getCityWeather(tCityName)).called(1);
    //   },
    // );

  });


}