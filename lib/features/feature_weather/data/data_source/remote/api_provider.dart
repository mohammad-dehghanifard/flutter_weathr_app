import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_watter_app_deom/core/params/fore_cast_param.dart';
import 'package:flutter_watter_app_deom/core/utils/constants.dart';

class ApiProvider{
  final Dio _dio = Dio();
  final String apiKey = Constants.apiKey;

  // call current Weather Api
  Future<dynamic> callCurrentWeather(cityName) async {
    final response = await _dio.get(
        "${Constants.baseUrl}/data/2.5/weather",
          queryParameters: {
          "q" : cityName,
          "appid" : apiKey,
          "units" : "metric"
         }
    );
    return response;
  }

  Future<dynamic> call7DaysForecastWeather(ForeCastPram pram) async {
    final response = await _dio.get(
      "${Constants.baseUrl}/data/2.5/onecall",
      queryParameters: {
        'lat': pram.lat,
        'lon': pram.lon,
        'exclude': 'minutely,hourly',
        'appid': apiKey,
        'units': 'metric'
      }
    );
    debugPrint(response.data.toString());
    return response;
  }
}