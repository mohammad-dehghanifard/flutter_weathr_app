
import 'package:flutter/cupertino.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/fore_cast_weather_entity.dart';

@immutable
abstract class FwStatus{}

class FwLoading extends FwStatus{}

class FwCompleted extends FwStatus{
  final ForecastDaysEntity entity;
  FwCompleted({required this.entity});
}

class FwError extends FwStatus{
  final String errorTxt;
  FwError({required this.errorTxt});
}