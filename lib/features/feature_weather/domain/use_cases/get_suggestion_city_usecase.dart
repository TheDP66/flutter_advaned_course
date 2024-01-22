import 'package:flutter_advaned_course/core/usecase/use_case.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/models/suggest_city_model.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/repositories/weather_repository.dart';

class GetSuggestionCityUseCase implements UseCase<List<Data>, String> {
  final WeatherRepository _weatherRepository;
  GetSuggestionCityUseCase(this._weatherRepository);

  @override
  Future<List<Data>> call(String param) {
    return _weatherRepository.fetchSuggestCityData(param);
  }
}
