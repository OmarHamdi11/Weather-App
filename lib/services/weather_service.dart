import 'dart:developer';

import 'package:weatherapp/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '092ecdef724043fbbad132042240103';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');

      WeatherModel weathermodel = WeatherModel.fromJson(response.data);

      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops Error!';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('OOps there was an error try again tater! ');
    }
  }
}
