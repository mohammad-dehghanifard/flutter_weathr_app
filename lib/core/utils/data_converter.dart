import 'package:intl/intl.dart';

class DateConverter{

  // تابع changeDtToDateTime، یک میلی ثانیه را به شکل تاریخ  تبدیل می کند.
  static String changeDtToDateTime(dt){
    final formatter = DateFormat.MMMd(); // از کتابخانه DateFormat برای تبدیل تاریخ استفاده می کنیم.
    var result = formatter.format(DateTime.fromMillisecondsSinceEpoch(
        dt * 1000,
        isUtc: true)); // تبدیل میلی ثانیه به تاریخ و زمان با استفاده از متد fromMillisecondsSinceEpoch در کلاس DateTime.

    return result; // خروجی تاریخ و زمان به صورت رشته ای (String)
  }

  // تابع changeDtToDateTimeHour، یک میلی ثانیه (در واحد ثانیه) را به شکل تاریخ و زمانی که از میلی ثانیه شروع می شود، تبدیل می کند. در این تابع، زمان منطقه زمانی مورد نظر را نیز در نظر می گیریم و در خروجی تاریخ و زمان را به صورت ساعت و دقیقه نمایش می دهیم.
  static String changeDtToDateTimeHour(dt, timeZone){
    final formatter = DateFormat.jm(); // از کتابخانه DateFormat برای تبدیل تاریخ و ساعت استفاده می کنیم.
    return formatter.format(
        DateTime.fromMillisecondsSinceEpoch(
            (dt * 1000) +
                timeZone * 1000,
            isUtc: true)); // تبدیل میلی ثانیه به تاریخ و زمان با در نظر گرفتن منطقه زمانی در دستور DateTime.

  }
}