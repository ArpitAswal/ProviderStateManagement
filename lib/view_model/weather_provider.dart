import 'package:flutter/cupertino.dart';

class WeatherProvider extends ChangeNotifier {
  double _temperature = 10.0;
  double _humidity = 11.0;
  double _windSpeed = 12.0;

  double get temperature => _temperature;
  double get humidity => _humidity;
  double get windSpeed => _windSpeed;

  void updateTemperature(double newTemperature) {
    _temperature = newTemperature;
    notifyListeners();
  }

  void updateHumidity(double newHumidity) {
    _humidity = newHumidity;
    notifyListeners();
  }

  void updateWindSpeed(double newWindSpeed) {
    _windSpeed = newWindSpeed;
    notifyListeners();
  }
}
