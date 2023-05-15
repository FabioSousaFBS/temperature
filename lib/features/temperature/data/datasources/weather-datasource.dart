
import 'package:temperature/features/temperature/data/models/weather-model.dart';
import 'package:temperature/features/temperature/domain/entities/location_entity.dart';

abstract class IWeatherDataSource{

  Future<WeatherModel> getLocationWeather(Location location);

  Future<WeatherModel> getCityWeather(String cityName);

}
