
abstract class DataState<T>{
  final T? data;
  final String? errorTxt;

  const DataState(this.data, this.errorTxt);
}

class DataSuccess<T> extends DataState<T>{
  const DataSuccess(T? data) : super(data,null);
}

class DataFiled<T> extends DataState<T>{
  const DataFiled(String? errorMassage) : super(null,errorMassage);
}