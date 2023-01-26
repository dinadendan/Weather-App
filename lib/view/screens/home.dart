import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/view/screens/search.dart';

import '../../controller/cubit.dart';
import '../../controller/states.dart';


class MyWeather extends StatelessWidget {
  const MyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        WeatherCubit cubit = WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "My Weather",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            elevation: 0,
            backgroundColor: Colors.blue[800],
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 24,
                  ))
            ],
          ),
          body: cubit.weatherModel != null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                " ${cubit.weatherModel!.name}, ${cubit.weatherModel!.country} ",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                cubit.weatherModel!.localtime,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/night.png'),
                  Text(
                    '${cubit.weatherModel!.avgtemp_c}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'maxtemp ${cubit.weatherModel!.maxtemp_c} ',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'mintemp ${cubit.weatherModel!.mintemp_c} ',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Text(
                cubit.weatherModel!.text,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: const Text(
                    "there is no weather now, search and Select Your Country 🔎😄",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}