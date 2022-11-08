import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/weather.dart';
import 'weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading_Screen extends StatefulWidget {
  const Loading_Screen({Key? key}) : super(key: key);

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var data = await weatherModel.getLocationWeather();
    print(data['name']);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Weather_Screen(
        weatherData: data,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/load_screen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fetching Data",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'PoppinsLight',
                    fontWeight: FontWeight.w600),
              ),
              SpinKitCircle(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
