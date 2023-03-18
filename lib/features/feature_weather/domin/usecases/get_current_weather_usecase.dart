import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/core/resourses/use_case.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/current_weathr_city_entity.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/repository/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<DataState<CurrentWeatherCityEntity>,String>{
  WeatherRepository weatherRepository;
  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  //param => cityName
  Future<DataState<CurrentWeatherCityEntity>> call(String param) => weatherRepository.fetchCurrentWeatherData(param);
}