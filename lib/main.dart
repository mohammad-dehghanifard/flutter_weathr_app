import 'package:flutter/material.dart';
import 'package:flutter_watter_app_deom/core/widgets/main_wrapper.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/home_bloc.dart';
import 'package:flutter_watter_app_deom/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  await serviceLocatorSetup();
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water App Demo',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomeBloc(locator(),locator())),
        ],
        child: MainWrapper(),
      )
  ));
}


