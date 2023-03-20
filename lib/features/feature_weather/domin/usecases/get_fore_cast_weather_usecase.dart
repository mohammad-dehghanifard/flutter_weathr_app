import 'package:flutter_watter_app_deom/core/params/fore_cast_param.dart';
import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/core/resourses/use_case.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/fore_cast_weather_entity.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/repository/weather_repository.dart';

class GetForeCastWeatherUseCase extends UseCase<DataState<ForecastDaysEntity>,ForeCastPram>{
  WeatherRepository weatherRepository;
  GetForeCastWeatherUseCase(this.weatherRepository);

  @override
  Future<DataState<ForecastDaysEntity>> call(ForeCastPram param) => weatherRepository.fetchForeCastWeatherData(param);
}