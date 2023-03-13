import 'package:dio/dio.dart';
import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/feature/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_watter_app_deom/feature/feature_weather/data/models/current_weathr_city_model.dart';
import 'package:flutter_watter_app_deom/feature/feature_weather/domin/entities/current_weathr_city_entity.dart';
import 'package:flutter_watter_app_deom/feature/feature_weather/domin/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository{
  ApiProvider apiProvider;
  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentWeatherCityEntity>> fetchCurrentWeatherData(String cityName) async {
    try{
      Response response = await apiProvider.callCurrentWeather(cityName);
      if(response.statusCode == 200){
        CurrentWeatherCityEntity currentWeatherCityEntity = CurrentWeatherCityModel.fromJson(response.data);
        return DataSuccess(currentWeatherCityEntity);
      }else{
        return const DataFiled("خطایی به وجود آمده است. لطفا دوباره امتحان کنید");
      }
    }catch(e){
      return const DataFiled("ارتباط با سرور با مشکل مواجه شده است. لطفا با پشتیبانی تماس بگیرید");
    }
  }
}