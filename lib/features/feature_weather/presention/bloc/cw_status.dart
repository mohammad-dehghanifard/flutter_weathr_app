import 'package:flutter/material.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/current_weathr_city_entity.dart';

@immutable
abstract class CwStatus {}

class CwLoading extends CwStatus {}

class CwCompleted extends CwStatus {
 final CurrentWeatherCityEntity currentWeatherCityEntity;
  CwCompleted({required this.currentWeatherCityEntity});
}

class CwError extends CwStatus {
  final String errorMassage;
  CwError(this.errorMassage);
}