import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_watter_app_deom/core/params/fore_cast_param.dart';
import 'package:flutter_watter_app_deom/core/widgets/app_background/app_background.dart';
import 'package:flutter_watter_app_deom/core/widgets/loading/loading_widget.dart';
import 'package:flutter_watter_app_deom/features/feature_bookmark/presention/bloc/book_mark_bloc.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/current_weathr_city_entity.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/entities/fore_cast_weather_entity.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/cw_status.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/fw_status.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/home_bloc.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/widgets/fore_cast_widget/fore_cast_weather_widget.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/widgets/indicator/inficator_widget.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/widgets/search_widget/search_text_field_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //page view controller
  final PageController pageController = PageController();

  String cityName = "Tehran";
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName: cityName ));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
        children: [
          // search field and book mark icon
          Row(
            children: [
              Expanded(child: AppSearchTextField()),
              const SizedBox(width: 6,),
              // زمانی که اطلاعات شهر داره لود میشه ایکون بوکمارک هم به حالت لودینگ میبره
              BlocBuilder<HomeBloc,HomeState>(
                buildWhen: (previous, current) {
                  if(current.cwStatus == previous.cwStatus){
                    return false;
                  }
                  return true;
                },
                  builder: (context, state) {
                  // show loading
                  if(state.cwStatus is CwLoading){
                    return const CircularProgressIndicator(color: Colors.white);
                  }
                  // completed
                  if(state.cwStatus is CwCompleted){
                   final CwCompleted data = state.cwStatus as CwCompleted;
                   //BlocProvider.of<BookMarkBloc>(context).add(GetCityByNameEvent(data.currentWeatherCityEntity.name!));
                  }
                  // show error
                    return Container();
                  },
              )
            ],
          ),
          // main ui
          BlocBuilder<HomeBloc,HomeState>(
            buildWhen: (previous, current) {
              if(current.cwStatus == previous.cwStatus){
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
              // call fore cast 7 days weather
              BlocProvider.of<HomeBloc>(context).add(LoadFwEvent(pram: ForeCastPram(lat: data.coord!.lat!,lon: data.coord!.lon!)));
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
                              return SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
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
                                ),
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
                            dotWidth: 10
                        ),
                      )
                    ),
                    SizedBox(height: size.height * 0.05),

                    // Divider
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6),
                      child:  Divider(color: Colors.grey,height: 8,),
                    ),
                    // fore cast 7days weather ui
                    SizedBox(
                      width: double.infinity,
                      height: size.height / 6.4,
                      child: Center(
                        child: BlocBuilder<HomeBloc,HomeState>(
                          buildWhen: (previous, current) {
                            if(current.fwStatus == previous.fwStatus){
                              return false;
                            }else{
                              return true;
                            }
                          },
                          builder: (context, state) {
                            // fw loading
                            if(state.fwStatus is FwLoading){
                                return const AppLoading(color: Colors.white, size: 50);
                            }

                            if(state.fwStatus is FwCompleted){
                              FwCompleted fwCompleted = state.fwStatus as FwCompleted;
                              ForecastDaysEntity data = fwCompleted.entity;

                              return ListView.builder(
                                  itemCount: data.daily!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:(context, index) {
                                   final item = data.daily![index];
                                    return Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: ForeCastWeather(item: item, size: size),
                                    );
                                  },
                              );
                            }
                            if(state.fwStatus is FwError){
                              return const Center(child: Text("خطایی به وجود اومده",style: TextStyle(color: Colors.white)));
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                    // Divider
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 6),
                      child:  Divider(color: Colors.grey,height: 12,),
                    ),
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

