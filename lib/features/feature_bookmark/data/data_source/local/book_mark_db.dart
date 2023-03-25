import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/data/data_source/local/dao.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/entities/city_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'book_mark_db.g.dart';

@Database(version: 1, entities: [CityEntity])
abstract class BookMarkDatabase extends FloorDatabase {
  BookMarkDbDao get dao;
}