import 'package:flutter_advaned_course/core/params/ForecastParams.dart';
import 'package:flutter_advaned_course/core/resources/data_state.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/entities/forecast_day_entity.dart';

abstract class WeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);

  Future<DataState<ForecastDayEntity>> fetchForecastWeatherData(
    ForecastParams params,
  );
}
