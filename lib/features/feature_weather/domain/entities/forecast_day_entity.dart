import 'package:equatable/equatable.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/models/forecast_day_model.dart';

class ForecastDayEntity extends Equatable {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Minutely>? minutely;
  List<Hourly>? hourly;
  List<Daily>? daily;
  List<Alerts>? alerts;

  ForecastDayEntity(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.minutely,
      this.hourly,
      this.daily,
      this.alerts});

  @override
  List<Object?> get props => [
        lat,
        lon,
        timezone,
        timezoneOffset,
        current,
        minutely,
        hourly,
        daily,
        alerts,
      ];
}
