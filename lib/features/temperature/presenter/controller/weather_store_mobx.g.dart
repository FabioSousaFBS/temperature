// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherController on WeatherControllerBase, Store {
  late final _$temperatureAtom =
      Atom(name: 'WeatherControllerBase.temperature', context: context);

  @override
  int get temperature {
    _$temperatureAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(int value) {
    _$temperatureAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  late final _$weatherIconAtom =
      Atom(name: 'WeatherControllerBase.weatherIcon', context: context);

  @override
  String get weatherIcon {
    _$weatherIconAtom.reportRead();
    return super.weatherIcon;
  }

  @override
  set weatherIcon(String value) {
    _$weatherIconAtom.reportWrite(value, super.weatherIcon, () {
      super.weatherIcon = value;
    });
  }

  late final _$cityNameAtom =
      Atom(name: 'WeatherControllerBase.cityName', context: context);

  @override
  String get cityName {
    _$cityNameAtom.reportRead();
    return super.cityName;
  }

  @override
  set cityName(String value) {
    _$cityNameAtom.reportWrite(value, super.cityName, () {
      super.cityName = value;
    });
  }

  late final _$weatherMessageAtom =
      Atom(name: 'WeatherControllerBase.weatherMessage', context: context);

  @override
  String get weatherMessage {
    _$weatherMessageAtom.reportRead();
    return super.weatherMessage;
  }

  @override
  set weatherMessage(String value) {
    _$weatherMessageAtom.reportWrite(value, super.weatherMessage, () {
      super.weatherMessage = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'WeatherControllerBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'WeatherControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_weatherFutureAtom =
      Atom(name: 'WeatherControllerBase._weatherFuture', context: context);

  @override
  ObservableFuture<Either<Failure, Weather>>? get _weatherFuture {
    _$_weatherFutureAtom.reportRead();
    return super._weatherFuture;
  }

  @override
  set _weatherFuture(ObservableFuture<Either<Failure, Weather>>? value) {
    _$_weatherFutureAtom.reportWrite(value, super._weatherFuture, () {
      super._weatherFuture = value;
    });
  }

  late final _$weatherAtom =
      Atom(name: 'WeatherControllerBase.weather', context: context);

  @override
  Weather get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(Weather value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  late final _$getCityWeatherAsyncAction =
      AsyncAction('WeatherControllerBase.getCityWeather', context: context);

  @override
  Future<void> getCityWeather(String cityName) {
    return _$getCityWeatherAsyncAction
        .run(() => super.getCityWeather(cityName));
  }

  late final _$getLocationWeatherAsyncAction =
      AsyncAction('WeatherControllerBase.getLocationWeather', context: context);

  @override
  Future<void> getLocationWeather() {
    return _$getLocationWeatherAsyncAction
        .run(() => super.getLocationWeather());
  }

  @override
  String toString() {
    return '''
temperature: ${temperature},
weatherIcon: ${weatherIcon},
cityName: ${cityName},
weatherMessage: ${weatherMessage},
errorMessage: ${errorMessage},
loading: ${loading},
weather: ${weather}
    ''';
  }
}
