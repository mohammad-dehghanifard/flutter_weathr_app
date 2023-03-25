import 'package:flutter/cupertino.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/entities/city_entity.dart';

@immutable
abstract class GetCityStatus{}

class GetCityLoading extends GetCityStatus{}

class GetCityCompleted extends GetCityStatus{
  final CityEntity cityEntity;

  GetCityCompleted({required this.cityEntity});
}

class GetCityError extends GetCityStatus{
  final String errorMsg;
  GetCityError(this.errorMsg);
}