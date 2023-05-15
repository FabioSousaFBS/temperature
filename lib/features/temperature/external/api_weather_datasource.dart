
import 'package:temperature/core/endpoints/weather_endpoints.dart';
import 'package:temperature/core/error/exceptions.dart';
import 'package:temperature/core/keys/open_weather_key.dart';
import 'package:temperature/core/services/network_helper/networking.dart';
import 'package:temperature/features/temperature/data/datasources/weather-datasource.dart';
import 'package:temperature/features/temperature/data/models/weather-model.dart';
import 'package:temperature/features/temperature/domain/entities/location_entity.dart';


class ApiWeatherDatasource implements IWeatherDataSource{
  final INetworkHelper client;

  ApiWeatherDatasource(this.client);

  @override
  Future<WeatherModel> getCityWeather(String cityName) async {    
    dynamic response = await client.get(WeatherEndPoints.weatherByCity(OpenWeatherKey.apiKey, cityName));
    
    if (response.statusCode == 200) {
     return WeatherModel.fromJson(response.data);
    }
    
    throw ServerException();        
      
  }

  @override
  Future<WeatherModel> getLocationWeather(Location location) async {
    dynamic response = await client.get(WeatherEndPoints.weatherByLocation(location, OpenWeatherKey.apiKey));
    
    if (response.statusCode == 200) {
     return WeatherModel.fromJson(response.data);
    }
    
    throw ServerException();  
  }
  
  

  

}
