import 'package:clima/services/location.dart';
import 'networking.dart';

class WeatherModel {
  final apiKey = 'ddc479a85da2f910a61f86da5f28c3b2';
  double latitudeX;
  double longitudeX;

  Future getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    Network networkHelper = Network(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  ///
  Future getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    latitudeX = loc.latitude;
    longitudeX = loc.longitude;

    //getData is used here to Ensure we don't pass empty values to API for lat and log

    Network networkHelper = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitudeX&lon=$longitudeX&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
