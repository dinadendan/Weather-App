import 'dart:convert';
import 'package:http/http.dart' as http;

class Crud {
  Future<Map<String, dynamic>> getWeather(String cityName) async {

    http.Response response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=2d48a476b4e24dc0879134640232601&q=$cityName'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody;
    } else {
      throw Exception(
          "the sever has an error with status code ${response.statusCode}");
    }
  }
}