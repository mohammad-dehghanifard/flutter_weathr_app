import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/core/resourses/use_case.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/repository/book_mark_db_repository.dart';

class DeleteCityByNameUseCase implements UseCase<DataState<String>,String>{
  final BookMarkDbRepository _dbRepository;
  DeleteCityByNameUseCase(this._dbRepository);

  @override
  Future<DataState<String>> call(String param) => _dbRepository.deleteCityByName(param);
}