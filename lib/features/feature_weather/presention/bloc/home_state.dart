part of 'home_bloc.dart';


class HomeState {
  CwStatus cwStatus; // Current weather
  FwStatus fwStatus; // fore cast 7days weather
  HomeState({required this.cwStatus,required this.fwStatus});

  HomeState copyWith({CwStatus? newCwStatus, FwStatus? newFwStatus}){
    return HomeState(cwStatus: newCwStatus ?? cwStatus,fwStatus: newFwStatus ?? fwStatus);
  }
}

