import 'package:bloc/bloc.dart';
import 'package:flutter_watter_app_deom/core/resourses/data_state.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/usecases/get_current_weather_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/cw_status.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  HomeBloc(this.getCurrentWeatherUseCase) : super(HomeState(cwStatus: CwLoading())) {

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
  }
}
