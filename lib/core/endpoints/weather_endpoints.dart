import 'package:temperature/features/temperature/domain/entities/location_entity.dart';

const urlBase = "https://api.openweathermap.org/data/2.5/weather";


class WeatherEndPoints{
  
  static String weatherByLocation(Location location, String apikey) => '$urlBase?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric'; 

  static String weatherByCity(String apiKey, String cityName) => "$urlBase?q=$cityName&appid=$apiKey&units=metric#";

}


