import 'package:flutter/cupertino.dart';

class AppBackGround{
  AppBackGround._();
  static AssetImage getAppBackGround(String formatDate){
    if(6 > int.parse(formatDate)){
      return const AssetImage("assets/images/nightpic.jpg");
    } else if(18 > int.parse(formatDate)){
      return const AssetImage("assets/images/pic_bg.jpg");
    } else{
      return const AssetImage("assets/images/pic_bg.jpg");
    }
  }

  static Image setIconForMain(description, height) {
    if (description == "clear sky") {
      return Image(
        image: const AssetImage(
          'assets/images/icons8-sun-96.png',
        ),height: height,);
    } else if (description == "few clouds") {
      return Image(image: const AssetImage('assets/images/icons8-partly-cloudy-day-80.png'),height: height);
    } else if (description.contains("clouds")) {
      return Image(image: const AssetImage('assets/images/icons8-clouds-80.png'),height: height);
    } else if (description.contains("thunderstorm")) {
      return Image(image: const AssetImage('assets/images/icons8-storm-80.png'),height: height);
    } else if (description.contains("drizzle")) {
      return Image(image: const AssetImage('assets/images/icons8-rain-cloud-80.png'),height: height);
    } else if (description.contains("rain")) {
      return Image(image: const AssetImage('assets/images/icons8-heavy-rain-80.png'),height: height);
    } else if (description.contains("snow")) {
      return Image(image: const AssetImage('assets/images/icons8-snow-80.png'),height: height);
    } else {
      return Image(image: const AssetImage('assets/images/icons8-windy-weather-80.png'),height: height);
    }
  }
}