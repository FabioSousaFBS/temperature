import 'package:get_it/get_it.dart';
import 'package:temperature/core/services/network_helper/networking_implementation.dart';
import 'package:temperature/features/temperature/data/repositories/weather-repository-implementation.dart';
import 'package:temperature/features/temperature/domain/usecases/weather_usecase.dart';
import 'package:temperature/features/temperature/external/api_weather_datasource.dart';

GetIt getIt = GetIt.I;

void setupLocator(){

  getIt.registerLazySingleton<NetworkHelper>(() => NetworkHelper());  
  getIt.registerLazySingleton<ApiWeatherDatasource>(() => ApiWeatherDatasource(
    GetIt.I.get<NetworkHelper>()
  ));
  getIt.registerLazySingleton<WeatherRepositoryImplementation>(() => WeatherRepositoryImplementation(
    GetIt.I.get<ApiWeatherDatasource>()
  ));

  getIt.registerLazySingleton<WeatherUsecase>(() => WeatherUsecase(
    GetIt.I.get<WeatherRepositoryImplementation>()
  ));

}

