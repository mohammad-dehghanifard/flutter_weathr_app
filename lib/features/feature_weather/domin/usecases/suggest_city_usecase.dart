import 'package:flutter_watter_app_deom/core/resourses/use_case.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/data/models/suggest_city_modle.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/repository/weather_repository.dart';

class GetCityInfoBySearchUseCase extends UseCase<List<SuggestCityData>,String>{
  WeatherRepository weatherRepository;
  GetCityInfoBySearchUseCase(this.weatherRepository);

  @override
  Future<List<SuggestCityData>> call(String param) => weatherRepository.fetchCityInfoBySearch(param);
}