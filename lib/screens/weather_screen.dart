import 'package:flutter/material.dart';
import 'package:weather/services/bg_image.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:weather/services/ReusableCard.dart';

class Weather_Screen extends StatefulWidget {
  final weatherData;
  Weather_Screen({required this.weatherData});

  @override
  State<Weather_Screen> createState() => _Weather_ScreenState();
}

class _Weather_ScreenState extends State<Weather_Screen> {
  BgImage bgImage = BgImage();

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  int temperature = 0;
  var city;
  var description;
  var windSpeed;
  var humidity;
  var pressure;

  void updateUI(var data) {
    double temp = data['main']['temp'];
    temperature = temp.round();
    city = data['name'];
    description = data['weather'][0]['description'];
    windSpeed = data['wind']['speed'];
    humidity = data['main']['humidity'];
    pressure = data['main']['pressure'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage.getImg()),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 27,
                              ),
                              Text(
                                '$city',
                                style: TextStyle(
                                    fontSize: 27, fontFamily: "PoppinsLight"),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.menu,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    GradientText(
                      "$temperature°",
                      gradientDirection: GradientDirection.ttb,
                      colors: [
                        Colors.white70,
                        Colors.white,
                        Colors.white,
                        Colors.white70,
                        Colors.white12,
                        Colors.white10
                      ],
                      style: TextStyle(
                        fontSize: 140,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        '$description',
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: "PoppinsLight",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 50),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReusableCard(
                          value: '$windSpeed' + 'Km',
                          textType: 'Wind',
                          icon: Icons.air_sharp,
                        ),
                        ReusableCard(
                            value: '$humidity',
                            textType: 'Humidity',
                            icon: Icons.water_drop_outlined),
                        ReusableCard(
                          value: '$pressure',
                          textType: 'Pressure',
                          icon: Icons.electric_meter,
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
