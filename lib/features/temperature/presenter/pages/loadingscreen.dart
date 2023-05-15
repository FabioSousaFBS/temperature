import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:temperature/features/temperature/domain/usecases/weather_usecase.dart';
import 'package:temperature/features/temperature/presenter/controller/weather_store_mobx.dart';
import 'package:temperature/features/temperature/presenter/pages/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late WeatherController _store;
  

  @override
  void didChangeDependencies() {
    _store = Provider.of<WeatherController>(context);
    
    getLocationData();

    super.didChangeDependencies();
  }

  void getLocationData() async {
    
    await _store.getLocationWeather().then((value){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen();
      }));

    });    

  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        )
      ),
    );
  }
}
