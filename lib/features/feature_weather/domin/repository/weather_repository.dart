import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/current_weathr_city_entity.dart';

abstract class WeatherRepository{
  Future<DataState<CurrentWeatherCityEntity>> fetchCurrentWeatherData(String cityName);
}