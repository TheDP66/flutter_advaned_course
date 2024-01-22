import 'package:equatable/equatable.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/models/suggest_city_model.dart';

class SuggestCityEntity extends Equatable {
  List<Links>? links;
  List<Data>? data;
  Metadata? metadata;

  SuggestCityEntity({
    this.links,
    this.data,
    this.metadata,
  });

  @override
  List<Object?> get props => [
        links,
        data,
        metadata,
      ];

  @override
  bool? get stringify => true;
}
