import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature/core/services/service_locator.dart';
import 'package:temperature/features/temperature/presenter/controller/weather_store_mobx.dart';
import 'package:temperature/features/temperature/presenter/pages/loadingscreen.dart';

void main(){
  setupLocator();

  runApp(
  MultiProvider(providers: [
      Provider<WeatherController>(create: (context) => WeatherController(),),
    ],
    child: Temperature(),
  )
);

}

class Temperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}


