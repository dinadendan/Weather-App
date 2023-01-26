class WeatherModel {
  String name;
  String country;
  String localtime;
  String text;
  double maxtemp_c;
  double mintemp_c;
  double avgtemp_c;

  WeatherModel({
    required this.name,
    required this.country,
    required this.localtime,
    required this.text,
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.avgtemp_c,
  });


  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        name: json['location']['name'],
        country: json['location']['country'],
        localtime: json['location']['localtime'],
        text: json['current']['condition']['text'],
        maxtemp_c: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp_c: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        avgtemp_c: json['forecast']['forecastday'][0]['day']['avgtemp_c']);
  }
  @override
  String toString() {
    return super.toString();
  }
}