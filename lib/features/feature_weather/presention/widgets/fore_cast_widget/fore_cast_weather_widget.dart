import 'package:flutter/material.dart';
import 'package:flutter_watter_app_deom/core/utils/data_converter.dart';
import 'package:flutter_watter_app_deom/core/widgets/app_background/app_background.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/data/models/fore_cast_weather_model.dart';

class ForeCastWeather extends StatelessWidget {
  const ForeCastWeather({
    super.key,
    required this.item,
    required this.size,
  });

  final Daily item;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //day text
        Text(DateConverter.changeDtToDateTime(item.dt),style: const TextStyle(color: Colors.white)),
        SizedBox(height: size.height * 0.02),
        // img
        AppBackGround.setIconForMain(item.weather![0].description,size.width * 0.1),
        SizedBox(height: size.height * 0.02),
        // day temp
        Text("${item.temp!.day!.round()}\u00B0",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      ],
    );
  }
}
