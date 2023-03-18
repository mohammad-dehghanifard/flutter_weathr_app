import 'package:flutter/cupertino.dart';

class AppBackGround{
  static AssetImage getAppBackGround(String formatDate){
    if(6 > int.parse(formatDate)){
      return const AssetImage("assets/images/nightpic.jpg");
    } else if(18 > int.parse(formatDate)){
      return const AssetImage("assets/images/pic_bg.jpg");
    } else{
      return const AssetImage("assets/images/pic_bg.jpg");
    }
  }
}