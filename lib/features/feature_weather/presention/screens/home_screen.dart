import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_watter_app_deom/core/widgets/app_background/app_background.dart';
import 'package:flutter_watter_app_deom/core/widgets/loading/loading_widget.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/current_weathr_city_entity.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/cw_status.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/home_bloc.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/widgets/indicator/inficator_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = "Tehran";
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName: cityName ));
  }
  //page view controller
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<HomeBloc,HomeState>(
            buildWhen: (previous, current) {
              if(current == previous){
                return false;
              }else{
                return true;
              }
            },
            builder: (context, state) {
            if(state.cwStatus is CwLoading){
              return const AppLoading(color: Colors.white, size: 50);
            }
            if(state.cwStatus is CwCompleted){
              // دریافت اطلاعات
              CwCompleted cwCompleted = state.cwStatus as CwCompleted;
              CurrentWeatherCityEntity data = cwCompleted.currentWeatherCityEntity;
              // ui
              return Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    //page view
                    SizedBox(
                      width: size.width,
                      height: size.height / 2.1,
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: 2,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if(index == 0){
                              return Column(
                                children: [
                                  // city name
                                  Text(data.name!,style: const TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                                  SizedBox(height: size.height * 0.01),
                                  // weather description
                                  Text(data.weather![0].description!,style: const TextStyle(color: Colors.grey,fontSize: 18)),
                                  // weather icon
                                  AppBackGround.setIconForMain(data.weather![0].description!, size.width * 0.5),
                                  // main weather
                                  Text("${data.main!.temp!.round()}\u00B0",style: const TextStyle(color: Colors.white,fontSize: 42,fontWeight: FontWeight.bold)),
                                  SizedBox(height: size.height * 0.02),
                                  //max and main weather
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // max temp weather
                                      Column(
                                        children: [
                                          const Text("max",style: TextStyle(color: Colors.grey,fontSize: 16)),
                                          SizedBox(height: size.height * 0.003),
                                          Text("${data.main!.tempMax!.round()}\u00B0",style: const TextStyle(color: Colors.white,fontSize: 20)),
                                        ],
                                      ),
                                      // divider
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                                        width: 1,
                                        height: 45,
                                        color: Colors.grey,
                                      ),
                                      // main weather
                                      Column(children: [
                                        const Text("main",style: TextStyle(color: Colors.grey,fontSize: 16)),
                                        SizedBox(height: size.height * 0.003),
                                        Text("${data.main!.tempMin!.round()}\u00B0",style: const TextStyle(color: Colors.white,fontSize: 20)),
                                      ],
                                      ),
                                    ],)

                                ],
                              );
                            }else{
                              return Container(color: Colors.blue);
                            }
                          },
                      ),
                    ),
                    // indicator
                    Center(
                      child: AppIndicatorWidget(
                        pageController: pageController,
                        count: 2,
                        effect: const ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.white,
                            dotHeight: 8,
                            dotWidth: 12
                        ),
                      )
                    )
                  ],
                ),
              );
            }
            return Container();
          },)
        ],
    ));
  }
}
