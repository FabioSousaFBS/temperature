

import 'package:flutter_test/flutter_test.dart';
import 'package:temperature/features/temperature/data/models/weather-model.dart';
import 'package:temperature/features/temperature/domain/entities/weather_entity.dart';

import '../../../../mocks/weather_mock.dart';

void main(){

  //const tCityName = 'Garça';
  final tWeatherModel = WeatherModel(id: 804, main: 'Clouds', description: 'overcast clouds', icon: 0, cityName: 'Garça', temperature: 20);

  test('Model should be a subclass of Weather', () {
    expect(tWeatherModel, isA<Weather>());    
  });

  test('Should return a valid model', (){
    
    final result = WeatherModel.fromJson(weatherMock);

    expect(result, tWeatherModel);

  });

  test('Should return a json map containing the proper data', (){

    final expectMap = {
      "id": 804,
      "main": "Clouds",
      "description": "overcast clouds",
      "icon": "04d",
      "name": "Garça",
    };

    final result = tWeatherModel.toJson();

    expect(result, expectMap);

  });

}
