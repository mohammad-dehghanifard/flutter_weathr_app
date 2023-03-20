part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

// Cw : Current Weather by CityName
class LoadCwEvent extends HomeEvent{
  final String cityName;
  LoadCwEvent({required this.cityName});
}

// Fw : Fore Cast 7days weather
class LoadFwEvent extends HomeEvent{
  final ForeCastPram pram;
  LoadFwEvent({required this.pram});
}