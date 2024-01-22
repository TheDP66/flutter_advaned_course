import 'package:flutter_advaned_course/core/resources/data_state.dart';
import 'package:flutter_advaned_course/features/feature_bookmark/domain/entities/city_entity.dart';
import 'package:flutter_advaned_course/features/feature_bookmark/domain/repository/city_repository.dart';

class CityRepositoryImpl extends CityRepository {
  @override
  Future<DataState<String>> deleteCityByName(String name) {
    // TODO: implement deleteCityByName
    throw UnimplementedError();
  }

  @override
  Future<DataState<City?>> findCityByName(String name) {
    // TODO: implement findCityByName
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<City>>> getAllCityFromDB() {
    // TODO: implement getAllCityFromDB
    throw UnimplementedError();
  }

  @override
  Future<DataState<City>> saveCityToDB(String cityName) {
    // TODO: implement saveCityToDB
    throw UnimplementedError();
  }
}
