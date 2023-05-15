import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:temperature/core/constants/constants.dart';
import 'package:temperature/features/temperature/presenter/controller/weather_store_mobx.dart';
import 'package:temperature/features/temperature/presenter/pages/city_screen.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen();
  
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  late WeatherController _store;
 
  @override
  void didChangeDependencies() {
    _store = Provider.of<WeatherController>(context);
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
           image: DecorationImage(
             image: const AssetImage('images/location_background.jpg'),
             fit: BoxFit.cover,
             colorFilter: ColorFilter.mode(
                 Colors.white.withOpacity(0.8), BlendMode.dstATop),
           ),
         ),
         constraints: const BoxConstraints.expand(),
         child: SafeArea(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children:[
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   ElevatedButton(
                     onPressed: () async {
                       await _store.getLocationWeather();                       
                     },
                     child: const Icon(
                       Icons.near_me,
                       size: 50.0,
                     ),
                   ),
                   ElevatedButton(
                     onPressed: () async {
                      var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                         return CityScreen();
                      }));
                      if(typedName != null){
                        await _store.getCityWeather(typedName); 
                      }
                     },
                     child: const Icon(
                       Icons.location_city,
                       size: 50.0,
                     ),
                   ),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 15.0),
                 child: Row(
                   children: [
                    Observer(builder: (context) => Text('${_store.temperature}°', 
                        style: kTempTextStyle,
                      ),
                    ),
                    Observer(builder: (context) => Text(_store.weatherIcon, 
                        style: kConditionTextStyle,
                      ),
                    ),                     
                   ],
                 ),
               ),
               Padding(
                padding: const EdgeInsets.only(right: 15.0),
                  child: Observer(
                    builder: (context) {
                      return Text(
                        "${_store.weatherMessage} in ${_store.cityName}!",
                        textAlign: TextAlign.right,
                        style: kMessageTextStyle,
                      );
                    }
                  )
               ),
             ],
           ),
         ),
       ),
     );
  }
}


