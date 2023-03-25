import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/entities/city_entity.dart';

abstract class BookMarkDbRepository{
  Future<DataState<List<CityEntity>>> getAllItems();

  Future<DataState<CityEntity>> saveCityToDb(String cityName);

  Future<DataState<String>> deleteCityByName(String name);

  Future<DataState<CityEntity?>> selectCityByName(String name);
}