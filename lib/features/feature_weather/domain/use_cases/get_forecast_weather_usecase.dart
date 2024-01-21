import 'package:flutter_advaned_course/core/params/ForecastParams.dart';
import 'package:flutter_advaned_course/core/resources/data_state.dart';
import 'package:flutter_advaned_course/core/usecase/use_case.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/entities/forecast_day_entity.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/repositories/weather_repository.dart';

class GetForecastWeatherUseCase
    implements UseCase<DataState<ForecastDayEntity>, ForecastParams> {
  final WeatherRepository _weatherRepository;

  GetForecastWeatherUseCase(this._weatherRepository);

  @override
  Future<DataState<ForecastDayEntity>> call(ForecastParams params) {
    return _weatherRepository.fetchForecastWeatherData(params);
  }
}
