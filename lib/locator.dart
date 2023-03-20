
import 'package:flutter_watter_app_deom/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/data/repository/weather_repository_impl.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/repository/weather_repository.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/usecases/get_current_weather_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/usecases/get_fore_cast_weather_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

serviceLocatorSetup(){

 //api provider
 locator.registerSingleton<ApiProvider>(ApiProvider());

 //repositories
 locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));

 //useCases
 locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator()));
 locator.registerSingleton<GetForeCastWeatherUseCase>(GetForeCastWeatherUseCase(locator()));

 //blocs
 locator.registerSingleton<HomeBloc>(HomeBloc(locator(),locator()));
}