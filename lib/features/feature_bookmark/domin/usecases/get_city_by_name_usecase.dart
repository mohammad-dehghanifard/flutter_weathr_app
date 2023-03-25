import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/core/resourses/use_case.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/entities/city_entity.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/repository/book_mark_db_repository.dart';

class GetCityByNameUseCase implements UseCase<DataState<CityEntity?>,String>{
  final BookMarkDbRepository _dbRepository;

  GetCityByNameUseCase(this._dbRepository);

  @override
  Future<DataState<CityEntity?>> call(String param) => _dbRepository.selectCityByName(param);

}