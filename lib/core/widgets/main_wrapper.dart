import 'package:flutter/material.dart';
import 'package:flutter_watter_app_deom/core/widgets/app_background/app_background.dart';
import 'package:flutter_watter_app_deom/core/widgets/bottom_navigation/bottom_navigation_bar.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/presention/screens/book_mark_screen.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/screens/home_screen.dart';
import 'package:intl/intl.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);
  final PageController pageController = PageController();
  final List<Widget> pageList = const [HomeScreen(),BookMarkScreen()];

  @override
  Widget build(BuildContext context) {

    DateTime currentTime = DateTime.now(); // دریافت تایم فعلی
    String formatDate = DateFormat('kk').format(currentTime); // kk => ساعت رو به صورت رند بدون در نظر گرفتن دقیقه برمیگردونه

    //page size
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true, // کل صفحه زیر {bottomNavigationBar} قرار میگیره
      bottomNavigationBar: AppBottomNav(controller: pageController) ,
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppBackGround.getAppBackGround(formatDate),
            fit: BoxFit.cover
          ),
        ),
        child: PageView(
          controller: pageController,
          children: pageList,
        ),
      )
    );
  }
}
