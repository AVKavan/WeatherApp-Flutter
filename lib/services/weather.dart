import 'networking.dart';
import 'location.dart';

const apiKey = 'b20887ff123024fdc60e58ce5c2caf4b';

class WeatherModel {
  Future getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    return networkHelper.getData();
  }
}
