import 'package:flutter/material.dart';

class BgImage {
  DateTime now = DateTime.now();
  String getImg() {
    if (now.hour.toInt() < 18 && now.hour.toInt() > 6)
      return 'images/day_mountain.jpg';
    else
      return 'images/night_mountain.jpg';

  }
}
