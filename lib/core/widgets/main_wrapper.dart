import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/cw_status.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/home_bloc.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName: 'Shiraz'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc,HomeState>(
        builder: (context, state) {
          if(state.cwStatus is CwLoading){
            return const Center(child: Text('loading...'));
          }
          if(state.cwStatus is CwCompleted){
            return const Center(child: Text('completed...'));
          }
          if(state.cwStatus is CwError){
            return const Center(child: Text('error'));
          }
          return Center(child: Text(state.toString()),);

        },
      ),
    );
  }
}
