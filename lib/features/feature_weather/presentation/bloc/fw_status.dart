import 'package:flutter/material.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/entities/forecast_day_entity.dart';

@immutable
abstract class FwStatus {}

class FwLoading extends FwStatus {}

class FwCompleted extends FwStatus {
  final ForecastDayEntity forecastDayEntity;

  FwCompleted({required this.forecastDayEntity});
}

class FwError extends FwStatus {
  final String message;

  FwError({required this.message});
}
