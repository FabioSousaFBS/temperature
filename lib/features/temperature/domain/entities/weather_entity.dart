import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  int id;
  String main;
  String description;
  int icon;
  String cityName;
  int temperature;

  Weather({
    required this.id, 
    required this.main, 
    required this.description, 
    required this.icon,
    required this.cityName,
    required this.temperature
  });
  
  @override  
  List<Object?> get props => [
    id,
    main,
    description,
    icon,
    cityName,
    temperature,
  ];
  
}