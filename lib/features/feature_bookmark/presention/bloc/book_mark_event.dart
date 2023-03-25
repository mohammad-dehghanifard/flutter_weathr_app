part of 'book_mark_bloc.dart';

@immutable
abstract class BookMarkEvent {}

class GetAllCityEvent extends BookMarkEvent{}

class GetCityByNameEvent extends BookMarkEvent{
  final String cityName;
  GetCityByNameEvent(this.cityName);
}

class SaveCwEvent extends BookMarkEvent{
  final String cityName;
  SaveCwEvent(this.cityName);
}

class SaveCityInitialEvent extends BookMarkEvent{}

class DeleteCityEvent extends BookMarkEvent{
  final String cityName;
  DeleteCityEvent(this.cityName);
}