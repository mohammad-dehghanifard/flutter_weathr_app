import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/data/models/suggest_city_modle.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/domin/usecases/suggest_city_usecase.dart';
import 'package:flutter_watter_app_deom/features/feature_weather/presention/bloc/home_bloc.dart';
import 'package:flutter_watter_app_deom/locator.dart';

class AppSearchTextField extends StatelessWidget {
   AppSearchTextField({Key? key}) : super(key: key);
  // search use case
  final GetCityInfoBySearchUseCase searchUseCase = GetCityInfoBySearchUseCase(locator());
  // text field controller
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12,16,12,0),
      child: TypeAheadField(
        // تنظیماتی کلی
        textFieldConfiguration: TextFieldConfiguration(
          controller: textEditingController,
          // زمانی که کاربر دکمه اینتر گوشی رو بزنه
          onSubmitted: (String prefix) {
            textEditingController.text = prefix;
            BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName: prefix));
          },
          style: const TextStyle(color: Colors.grey),
          decoration:  InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.white,width: 1)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.white,width: 1)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.white,width: 1)
            ),
          ),
        ),
        suggestionsCallback: (prefix) async {
          return searchUseCase(prefix);
        },
        // نحوه نمایش ایتم های پیدا شده
        itemBuilder: (context, SuggestCityData model) {
          return ListTile(
            leading: const Icon(Icons.location_on_sharp),
            title: Text(model.name!),
            subtitle: Text("${model.region} ${model.country}"),
          );
        },
        onSuggestionSelected: (SuggestCityData model) {
          textEditingController.text = model.name!;
          BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName: model.name!));
        },
      ),
    );
  }
}
