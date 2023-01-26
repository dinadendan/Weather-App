import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/controller/states.dart';
import '../models/weatherModel.dart';
import '../services/crud.dart';


class WeatherCubit extends Cubit<WeatherStates> {

  WeatherCubit() : super(InitialState());
  static WeatherCubit get(context) => BlocProvider.of(context);


  WeatherModel? weatherModel;
  Crud crud = Crud();
  TextEditingController controller = TextEditingController();


  getWeather(String cityName, BuildContext context) async {

    emit(LoadingState());
    var response = await crud.getWeather(cityName);
    if (response is Map<String, dynamic>){
      weatherModel = WeatherModel.fromJson(response);
      Navigator.of(context).pop();
      emit(SuccessState());
    } else {
      emit(ErrorState());
    }
  }
}