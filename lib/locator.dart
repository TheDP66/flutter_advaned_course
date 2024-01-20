import 'package:flutter_advaned_course/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/repositories/weather_repository.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());

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

  /// bloc
  locator.registerSingleton<HomeBloc>(
    HomeBloc(
      locator(),
    ),
  );
}
