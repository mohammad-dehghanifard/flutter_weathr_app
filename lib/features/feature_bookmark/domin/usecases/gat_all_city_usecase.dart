import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/core/resourses/use_case.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/entities/city_entity.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/repository/book_mark_db_repository.dart';

class GetAllCityUseCase implements UseCase<DataState<List<CityEntity>>,NoParams>{
  final BookMarkDbRepository _dbRepository;

  GetAllCityUseCase(this._dbRepository);

  @override
  Future<DataState<List<CityEntity>>> call(NoParams param) => _dbRepository.getAllItems();



}