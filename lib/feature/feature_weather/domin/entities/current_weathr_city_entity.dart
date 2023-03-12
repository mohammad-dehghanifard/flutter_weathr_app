import 'package:equatable/equatable.dart';
import 'package:flutter_watter_app_deom/feature/feature_weather/data/models/current_weathr_city_model.dart';

class CurrentWeatherCityEntity extends Equatable{

  final Coord? coord;
  final List<WeatherDescription>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;


 const CurrentWeatherCityEntity(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  @override
  // مشخص میکنه که برای مقایسه دو ابجکت چه متغیر هایی رو باید برسی کنیم
  List<Object?> get props => [];
}