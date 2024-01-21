import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advaned_course/core/params/ForecastParams.dart';
import 'package:flutter_advaned_course/core/resources/data_state.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/bloc/fw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetForecastWeatherUseCase getForecastWeatherUseCase;

  HomeBloc(
    this.getCurrentWeatherUseCase,
    this.getForecastWeatherUseCase,
  ) : super(
          HomeState(
            cwStatus: CwLoading(),
            fwStatus: FwLoading(),
          ),
        ) {
    on<LoadCwEvent>(
      (event, emit) async {
        emit(
          state.copyWith(newCwStatus: CwLoading()),
        );

        DataState dataState = await getCurrentWeatherUseCase(event.cityName);

        if (dataState is DataSuccess) {
          emit(
            state.copyWith(
              newCwStatus: CwCompleted(currentCityEntity: dataState.data),
            ),
          );
        }

        if (dataState is DataFailed) {
          emit(
            state.copyWith(
              newCwStatus: CwError(message: dataState.error!),
            ),
          );
        }
      },
    );

    on<LoadFwEvent>((event, emit) async {
      emit(
        state.copyWith(
          newFwStatus: FwLoading(),
        ),
      );

      DataState dataState = await getForecastWeatherUseCase(
        event.forecastParams,
      );

      if (dataState is DataSuccess) {
        emit(
          state.copyWith(
            newFwStatus: FwCompleted(forecastDayEntity: dataState.data),
          ),
        );
      }

      if (dataState is DataFailed) {
        emit(
          state.copyWith(
            newFwStatus: FwError(message: dataState.error!),
          ),
        );
      }
    });
  }
}
