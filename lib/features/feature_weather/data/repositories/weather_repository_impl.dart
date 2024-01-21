import 'package:dio/dio.dart';
import 'package:flutter_advaned_course/core/params/ForecastParams.dart';
import 'package:flutter_advaned_course/core/resources/data_state.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/models/current_city_model.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/models/forecast_day_model.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/entities/forecast_day_entity.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  ApiProvider apiProvider;

  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
    String cityName,
  ) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);

      print(response.data);

      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity = CurrentCityModel.fromJson(
          response.data,
        );

        return DataSuccess(currentCityEntity);
      } else {
        return DataFailed(response.statusMessage.toString());
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<ForecastDayEntity>> fetchForecastWeatherData(
      ForecastParams params) async {
    try {
      Response response = await apiProvider.sendRequest7DaysForcast(params);

      print(response.data);

      if (response.statusCode == 200) {
        ForecastDayEntity forecastDayEntity = ForecastDayModel.fromJson(
          response.data,
        );

        return DataSuccess(forecastDayEntity);
      } else {
        return DataFailed(response.statusMessage.toString());
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
