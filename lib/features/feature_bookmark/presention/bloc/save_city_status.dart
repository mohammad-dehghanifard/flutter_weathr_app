import 'package:flutter/cupertino.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/entities/city_entity.dart';

@immutable
abstract class SaveCityStatus{}

class SaveCityLoading extends SaveCityStatus{}

class SaveCityInitial extends SaveCityStatus{}

class SaveCityCompleted extends SaveCityStatus{
  final CityEntity cityEntity;
  SaveCityCompleted({required this.cityEntity});
}

class SaveCityError extends SaveCityStatus{
  final String errorMsg;
  SaveCityError(this.errorMsg);
}