import 'package:bloc/bloc.dart';
import 'package:flutter_watter_app_deom/core/params/fore_cast_param.dart';
import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/usecases/get_current_weather_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/usecases/get_fore_cast_weather_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/cw_status.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/fw_status.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetForeCastWeatherUseCase getForeCastWeatherUseCase;
  HomeBloc(this.getCurrentWeatherUseCase,this.getForeCastWeatherUseCase) : super(HomeState(cwStatus: CwLoading(),fwStatus: FwLoading())) {

    on<LoadCwEvent>((event, emit) async {
      emit(state.copyWith(newCwStatus: CwLoading()));
      DataState dataState = await getCurrentWeatherUseCase(event.cityName);
      // completed and get data
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newCwStatus:
                CwCompleted(currentWeatherCityEntity: dataState.data)));
      }
      // request field
      if (dataState is DataFiled) {
        emit(state.copyWith(newCwStatus: CwError(dataState.errorTxt!)));
      }
    });

    on<LoadFwEvent>((event, emit) async {
      emit(state.copyWith(newFwStatus: FwLoading()));
      DataState dataState = await getForeCastWeatherUseCase(event.pram);
      // completed and get data
      if(dataState is DataSuccess){
        emit(state.copyWith(newFwStatus: FwCompleted(entity: dataState.data)));
      }
      // request field
      if(dataState is DataFiled){
        emit(state.copyWith(newFwStatus: FwError(errorTxt: dataState.errorTxt!)));
      }
    }
    );
  }
}
