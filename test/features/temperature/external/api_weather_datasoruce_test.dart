import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temperature/core/error/exceptions.dart';
import 'package:temperature/core/services/network_helper/networking.dart';
import 'package:temperature/features/temperature/data/datasources/weather-datasource.dart';
import 'package:temperature/features/temperature/data/models/weather-model.dart';
import 'package:temperature/features/temperature/external/api_weather_datasource.dart';

import '../../../mocks/weather_mock.dart';


class NetworkHelperMock extends Mock implements INetworkHelper {}

void main(){

  late IWeatherDataSource datasource;
  late INetworkHelper client;

  setUp((){
    client = NetworkHelperMock();
    datasource = ApiWeatherDatasource(client);
  });

  void successMock(){
     when(() => client.get(any())).thenAnswer((_) async => HttpResponse(
      data: weatherMock, 
      statusCode: 200));
  }

  const tCityName = 'Garça';
  final urlExpect = 'https://api.openweathermap.org/data/2.5/weather?q=Gar%C3%A7a&appid=601d2f7d2b70cdbe347dbb3295a29f81&units=metric#';

  test('Should check if the url is correct', () async {
    
    successMock();
    
    await datasource.getCityWeather(tCityName);

    verifyNever(() => client.get(urlExpect)).called(0);

  });

  test('Should call the get city weather and return a WeatherModel', () async {
    
    successMock();

    final tWeatherModel = WeatherModel(id: 804, main: 'Clouds', description: 'overcast clouds', icon: 04, cityName: 'Garça', temperature: 20);
    
    final result = await datasource.getCityWeather(tCityName);

    expect(result, tWeatherModel);

  });

  test('Should throw an exception when the is unsuccessful', () async {
    
    //successMock();
    when(() => client.get(any())).thenAnswer((_) async => HttpResponse(data: 'Something went wrong', statusCode: 400)) ;

    final result = datasource.getCityWeather(tCityName);

    expect(() => result, throwsA(ServerException()));


  });
  

}
