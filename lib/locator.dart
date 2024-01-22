import 'package:flutter_advaned_course/features/feature_bookmark/data/data_source/local/database.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/repositories/weather_repository.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  /// repositories
  locator.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(
      locator(),
    ),
  );

  /// use case
  locator.registerSingleton<GetCurrentWeatherUseCase>(
    GetCurrentWeatherUseCase(
      locator(),
    ),
  );
  locator.registerSingleton<GetForecastWeatherUseCase>(
    GetForecastWeatherUseCase(
      locator(),
    ),
  );

  /// bloc
  locator.registerSingleton<HomeBloc>(
    HomeBloc(
      locator(),
      locator(),
    ),
  );
}
