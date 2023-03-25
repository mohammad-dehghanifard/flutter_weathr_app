part of 'book_mark_bloc.dart';

class BookMarkState{
  GetCityStatus getCityStatus;
  SaveCityStatus saveCityStatus;
  BookMarkState({required this.getCityStatus,required this.saveCityStatus});

  BookMarkState copyWith({GetCityStatus? newGetCityStatus,SaveCityStatus? newSaveCityStatus}){
    return BookMarkState(
        getCityStatus: newGetCityStatus ?? getCityStatus,
        saveCityStatus: newSaveCityStatus ?? saveCityStatus
    );
  }
}