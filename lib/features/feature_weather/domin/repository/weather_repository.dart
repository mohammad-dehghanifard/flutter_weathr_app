import 'package:flutter_watter_app_deom/core/params/fore_cast_param.dart';
import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/data/models/suggest_city_modle.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/current_weathr_city_entity.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/fore_cast_weather_entity.dart';

abstract class WeatherRepository{
  Future<DataState<CurrentWeatherCityEntity>> fetchCurrentWeatherData(String cityName);
  Future<DataState< ForecastDaysEntity>> fetchForeCastWeatherData(ForeCastPram pram);
  Future<List<SuggestCityData>> fetchCityInfoBySearch(String prefix);
}