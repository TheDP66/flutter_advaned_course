import 'package:flutter/material.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter_advaned_course/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/widgets/main_wrapper.dart';

void main() async {
  /// inject dependency
  await setup();

  runApp(
    MaterialApp(
      title: 'flutter_advanced_course',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => locator<HomeBloc>(),
          ),
          // BlocProvider(
          //   create: (_) => locator<HomeBloc>(),
          // ),
        ],
        child: MainWrapper(),
      ),
    ),
  );
}
