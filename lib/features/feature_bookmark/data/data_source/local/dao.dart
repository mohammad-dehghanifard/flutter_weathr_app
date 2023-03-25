import 'package:floor/floor.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/entities/city_entity.dart';

@dao
abstract class BookMarkDbDao{

  @Query("SELECT * FROM CityEntity")
  Future<List<CityEntity>> getAll();

  @Query("SELECT * FROM CityEntity WHERE cityName = :name")
  Future<CityEntity?> selectByName(String name);

  @insert
  Future<void> insertNewCity(CityEntity cityEntity);

  @Query("DELETE FROM CityEntity WHERE cityName = :name")
  Future<void> deleteCityByName(String name);


}