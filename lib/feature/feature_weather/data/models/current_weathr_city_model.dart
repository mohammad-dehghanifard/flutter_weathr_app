import 'package:flutter_watter_app_deom/feature/feature_weather/domin/entities/current_weathr_city_entity.dart';

class CurrentWeatherCityModel extends CurrentWeatherCityEntity {

  // کلاس مدل فایل های جیسون رو تبدیل به ابجکت دارت میکنه و کلاس  [Entity] از ابجکت های ساخته شده استفاده میکنه

  const CurrentWeatherCityModel(
      {
      Coord? coord,
      List<WeatherDescription>? weather,
      String? base,
      Main? main,
      int? visibility,
      Wind? wind,
      Rain? rain,
      Clouds? clouds,
      int? dt,
      Sys? sys,
      int? timezone,
      int? id,
      String? name,
      int? cod,
      }) : super(
    // زمانی که از کلاس مدل ابجکت بسازیم تمام ورودی ها دریافتیش رو برای کلاس والدش [Entity] ارسال میکنیم
    coord:  coord,
    weather: weather,
    base: base,
    main: main,
    visibility: visibility,
    wind: wind,
    rain: rain,
    clouds: clouds,
    dt: dt,
    sys: sys,
    timezone: timezone,
    id: id,
    name: name,
    cod: cod
  );

  factory CurrentWeatherCityModel.fromJson(dynamic json) {
    return CurrentWeatherCityModel(
      coord: json['coord'] != null? Coord.fromJson(json['coord']) : null,
      weather: (json['weather'] as List<dynamic>)
          .map((item) => WeatherDescription.fromJson(item))
          .toList(),
      base: json['base'],
      main: json['main'] != null ? Main.fromJson(json['main']) : null,
      visibility: json['visibility'],
      wind: json['wind'] != null? Wind.fromJson(json['wind']) : null,
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
      dt: json['dt'],
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

class Coord {
  double lon;
  double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(lon: json['lon'].toDouble(), lat: json['lat'].toDouble());
  }
}

class WeatherDescription {
  int id;
  String main;
  String description;
  String icon;

  WeatherDescription(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return WeatherDescription(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int groundLevel;

  Main(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      required this.seaLevel,
      required this.groundLevel});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      groundLevel: json['grnd_level'],
    );
  }
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
    );
  }
}

class Rain {
  double oneHour;

  Rain({required this.oneHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(oneHour: json['1h'].toDouble());
  }
}

class Clouds {
  int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }
}

class Sys {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  Sys(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
