// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:temperature/features/temperature/domain/entities/weather_entity.dart';

class WeatherModel extends Weather {

  WeatherModel({
    required int id,
    required String main,
    required String description,
    required int icon,
    required String cityName,
    required int temperature,
  }) : super(
    id: id,
    main: main,
    description: description,
    icon: icon,
    cityName: cityName,
    temperature: temperature
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
      'cityName': cityName,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(      
      id: map['weather'][0]['id'],
      main: map['weather'][0]['main'],
      description: map['weather'][0]['description'],
      icon: map['weather'][0]['id'],
      cityName: map['name'],
      temperature: (map['main']['temp'] as double).toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
