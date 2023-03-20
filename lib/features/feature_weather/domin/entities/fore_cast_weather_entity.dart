import 'package:flutter_watter_app_deom/features/feature_weather/data/models/fore_cast_weather_model.dart';

class ForecastDaysEntity {
  final double? lat;
  final double? lon;
  final String? timezone;
  final int? timezoneOffset;
  final Current? current;
  final List<Daily>? daily;
  final List<Alerts>? alerts;

  const ForecastDaysEntity({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.daily,
    this.alerts});

}
