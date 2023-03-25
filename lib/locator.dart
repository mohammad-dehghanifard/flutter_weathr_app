
import 'package:flutter_watter_app_deom/features/feature_bookmark/data/data_source/local/book_mark_db.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/data/repository/book_mark_db_repository_impl.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/usecases/delete_city_by_name_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/usecases/gat_all_city_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/usecases/get_city_by_name_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/usecases/save_city_to_db_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/data/repository/weather_repository_impl.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/repository/weather_repository.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/usecases/get_current_weather_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/usecases/get_fore_cast_weather_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

serviceLocatorSetup() async {

 //api provider
 locator.registerSingleton<ApiProvider>(ApiProvider());

 //weather repositories
 locator.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));

 //weather useCases
 locator.registerSingleton<GetCurrentWeatherUseCase>(GetCurrentWeatherUseCase(locator()));
 locator.registerSingleton<GetForeCastWeatherUseCase>(GetForeCastWeatherUseCase(locator()));

 //weather blocs
 locator.registerSingleton<HomeBloc>(HomeBloc(locator(),locator()));

 //local database
 final localDatabase = await $FloorBookMarkDatabase.databaseBuilder('book_mark_database.db').build();
 locator.registerSingleton<BookMarkDatabase>(localDatabase);
 

 //local database repository
 locator.registerSingleton<BookMarkDbRepositoryImpl>(BookMarkDbRepositoryImpl(localDatabase.dao));

 //local database useCase
 locator.registerSingleton<DeleteCityByNameUseCase>(DeleteCityByNameUseCase(locator()));
 locator.registerSingleton<GetAllCityUseCase>(GetAllCityUseCase(locator()));
 locator.registerSingleton<GetCityByNameUseCase>(GetCityByNameUseCase(locator()));
 locator.registerSingleton<SaveCityToDbUseCase>(SaveCityToDbUseCase(locator()));
 
}