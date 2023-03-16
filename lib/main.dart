import 'package:flutter/material.dart';
import 'package:flutter_watter_app_deom/core/widgets/main_wrapper.dart';
import 'package:flutter_watter_app_deom/locator.dart';

void main() async {
  await serviceLocatorSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water App Demo',
      home: MainWrapper()
    );
  }
}

