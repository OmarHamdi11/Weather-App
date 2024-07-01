import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.teal;
  }

  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'clear':
      return Colors.blue;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.indigo;
    case 'patchy rain possible':
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain':
    case 'heavy rain':
      return Colors.blue;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'snow':
    case 'blizzard':
    case 'heavy snow':
      return Colors.grey;
    case 'fog':
      return Colors.blueGrey;
    case 'freezing fog':
      return Colors.cyan;
    case 'patchy light drizzle':
    case 'light drizzle':
      return Colors.lightBlue;
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.cyan;
    case 'ice pellets':
    case 'sleet':
      return Colors.cyan;
    case 'light sleet showers':
    case 'light snow showers':
      return Colors.lightBlue;
    case 'moderate or heavy rain with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blueGrey; // Default color for unhandled conditions
  }
}
