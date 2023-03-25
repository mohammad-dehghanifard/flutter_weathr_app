abstract class UseCase<T,P>{
Future<T> call(P param);
}
class NoParams{}
//call : زمانی که تابع ها با این اسم تعریف بشن بدون صدا زدن اسم تابع میتونیم فراخوانیش کنیم