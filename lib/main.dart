import 'package:flutter/material.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';

import 'core/widgets/main_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetCurrentWeatherUseCase getCurrentWeatherUseCase =
        GetCurrentWeatherUseCase(
      WeatherRepositoryImpl(
        ApiProvider(),
      ),
    );

    getCurrentWeatherUseCase.call('tehran');

    return MaterialApp(
      title: 'flutter_advanced_course',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainWrapper(),
    );
  }
}
