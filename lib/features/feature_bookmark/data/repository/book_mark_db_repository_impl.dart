import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/data/data_source/local/dao.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/entities/city_entity.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/repository/book_mark_db_repository.dart';

class BookMarkDbRepositoryImpl extends BookMarkDbRepository{
  final BookMarkDbDao dao;

  BookMarkDbRepositoryImpl(this.dao);

  @override
  Future<DataState<String>> deleteCityByName(String name) async {
    try{
      await dao.deleteCityByName(name);
      return DataSuccess(name);
    }catch(e){
      return DataFiled(e.toString());
    }
  }

  @override
  Future<DataState<List<CityEntity>>> getAllItems() async {
    try{
      List<CityEntity> data = await dao.getAll();
      return DataSuccess(data);
    }catch(e){
      return DataFiled(e.toString());
    }
  }

  @override
  Future<DataState<CityEntity>> saveCityToDb(String cityName) async {
    try{
      // در صورتی که شهر قبلا اضافه شده باشه مجدد اضافه نمیشه
      CityEntity? city = await dao.selectByName(cityName);
      if(city != null){
        return DataFiled("$cityNameقبلا اضافه شده است ");
      }

      // اضافه کردن شهر به دیتابیس
      CityEntity cityEntity = CityEntity(cityName);
      await dao.insertNewCity(cityEntity);
      return DataSuccess(cityEntity);
      
    }catch(e){
      return DataFiled(e.toString());
    }
  }

  @override
  Future<DataState<CityEntity?>> selectCityByName(String name) async {
    try{
      CityEntity? city = await dao.selectByName(name);
      return DataSuccess(city);
    }catch(e){
      return DataFiled(e.toString());
    }
  }

}