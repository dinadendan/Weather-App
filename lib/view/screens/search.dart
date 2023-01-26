import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit.dart';
import '../../controller/states.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
      ),
      body: BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  controller: cubit.controller,
                  onSubmitted: (val) async {
                    await cubit.getWeather(val, context);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}