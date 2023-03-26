
import 'package:bloc/bloc.dart';
import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/core/resourses/use_case.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/usecases/gat_all_city_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/domin/usecases/save_city_to_db_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/presention/bloc/save_city_status.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/presention/bloc/get_city_status.dart';
import 'package:meta/meta.dart';

part 'book_mark_event.dart';
part 'book_mark_state.dart';

class BookMarkBloc extends Bloc<BookMarkEvent, BookMarkState> {
  GetAllCityUseCase allCityUseCase;
  SaveCityToDbUseCase saveCityToDbUseCase;
  BookMarkBloc(this.allCityUseCase,this.saveCityToDbUseCase) : super(BookMarkState(getCityStatus: GetCityLoading(), saveCityStatus: SaveCityLoading())) {

    // get all city from local database
    on<GetAllCityEvent>(
      (event, emit) async {
        //emit loading
        emit(state.copyWith(newGetCityStatus: GetCityLoading()));
        DataState dataState = await allCityUseCase(NoParams());

        // completed state
        if(dataState is DataSuccess) emit(state.copyWith(newGetCityStatus: GetCityCompleted(cityEntity: dataState.data)));

        // failed state
        if(dataState is DataFiled) emit(state.copyWith(newGetCityStatus: GetCityError(dataState.errorTxt!)));

      },
    );

    // save city bookmark
    on<SaveCwEvent>(
      (event, emit) async {
        //emit loading
        emit(state.copyWith(newSaveCityStatus: SaveCityLoading()));
        DataState dataState = await saveCityToDbUseCase(event.cityName);

        // completed state
        if(dataState is DataSuccess) emit(state.copyWith(newSaveCityStatus: SaveCityCompleted(cityEntity: dataState.data)));

        // failed state
        if(dataState is DataFiled) emit(state.copyWith(newSaveCityStatus: SaveCityError(dataState.errorTxt!)));
      },
    );

    // وضعیت دوباره با حالت اولیه برمیگرده و در صورتی که استفاده نشه ستاره بوکمارک پر میمونه
    on<SaveCityInitialEvent>((event, emit) {
      emit(state.copyWith(newSaveCityStatus: SaveCityInitial()));
    },);
  }
}
