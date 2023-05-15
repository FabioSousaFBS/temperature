
import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:temperature/core/error/failures.dart';
import 'package:temperature/features/temperature/data/repositories/weather-repository-implementation.dart';
import 'package:temperature/features/temperature/domain/entities/weather_entity.dart';
import 'package:temperature/features/temperature/domain/repositories/weather_repository.dart';
import 'package:temperature/features/temperature/domain/usecases/weather_usecase.dart';
import 'package:dartz/dartz.dart';

part 'weather_store_mobx.g.dart';

class WeatherController = WeatherControllerBase with _$WeatherController;

abstract class WeatherControllerBase with Store{

  late WeatherUsecase _usecase;
  late IWeatherRepository _repository;

  WeatherControllerBase(){
    _repository = GetIt.I.get<WeatherRepositoryImplementation>();
    _usecase = GetIt.I.get<WeatherUsecase>();

    updateFields();

    autorun((_){

    });

  }

  @observable
  int temperature = 0;

  @observable
  String weatherIcon = '';
  
  @observable
  String cityName = '';

  @observable
  String weatherMessage = '';


  @observable
  String errorMessage = '';

  @observable
  bool loading = false;  

  @observable
  ObservableFuture<Either<Failure, Weather>>? _weatherFuture; 

  @observable 
  Weather weather = Weather(id: 0, main: '', description: '', icon: 0, cityName: '', temperature: 0);

  @action
  Future<void> getCityWeather(String cityName) async {

    loading = true;

    _weatherFuture = ObservableFuture(_usecase.getCityWeather(cityName));
      
    var result = await _weatherFuture!;

    if (_weatherFuture!.status == FutureStatus.fulfilled) {

      result.fold((error){
        errorMessage = error.toString();
      } , (sucess) {
        weather = sucess;
      });      

      updateFields();
      
      loading = false;
      
    }

  }


  @action
  Future<void> getLocationWeather() async{

    loading = true;

    _weatherFuture = ObservableFuture(_usecase.getLocationWeather());
      
    var result = await _weatherFuture!;

    if (_weatherFuture!.status == FutureStatus.fulfilled) {

      result.fold((error){
        errorMessage = error.toString();
      } , (sucess) {
        weather = sucess;
      });

      updateFields();
      
      loading = false;
    }

  }

  updateFields(){

    if(weather.id == 0){
      temperature = 0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get weather data';
      cityName = '';
      
    }else{      
      temperature = weather.temperature;      
      weatherIcon = _usecase.getWeatherIcon(weather.icon.toInt());
      weatherMessage = _usecase.getMessage(weather.temperature);
      cityName = weather.cityName;
    }
    
    
    
    
    
    

  }

}

