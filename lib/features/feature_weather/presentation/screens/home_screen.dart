import 'package:flutter/material.dart';
import 'package:flutter_advaned_course/core/widgets/app_background.dart';
import 'package:flutter_advaned_course/core/widgets/dot_loading_widget.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/models/forecast_day_model.dart';
import 'package:flutter_advaned_course/features/feature_weather/data/models/suggest_city_model.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/entities/forecast_day_entity.dart';
import 'package:flutter_advaned_course/features/feature_weather/domain/use_cases/get_suggestion_city_usecase.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/bloc/fw_status.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/widgets/days_weather_view.dart';
import 'package:flutter_advaned_course/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  GetSuggestionCityUseCase getSuggestionCityUseCase =
      GetSuggestionCityUseCase(locator());

  TextEditingController textEditingController = TextEditingController();
  String cityName = "Surabaya";

  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeBloc>(context).add(
      LoadCwEvent(cityName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: TypeAheadField(
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    hintText: 'Enter a City...',
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                );
              },
              suggestionsCallback: (String prefix) {
                return getSuggestionCityUseCase(prefix);
              },
              itemBuilder: (context, Data model) {
                return ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(model.name!),
                  subtitle: Text("${model.region!}, ${model.country!}"),
                );
              },
              onSelected: (Data model) {
                textEditingController.text = model.name!;
                BlocProvider.of<HomeBloc>(context).add(
                  LoadCwEvent(
                    model.name!,
                  ),
                );
              },
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.cwStatus is CwLoading) {
                return const Expanded(child: DotLoadingWidget());
              }

              if (state.cwStatus is CwCompleted) {
                // cast
                final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
                final CurrentCityEntity currentCityEntity =
                    cwCompleted.currentCityEntity;

                // final ForecastParams forecastParams = ForecastParams(
                //   currentCityEntity.coord!.lat!,
                //   currentCityEntity.coord!.lon!,
                // );

                // BlocProvider.of<HomeBloc>(context).add(
                //   LoadFwEvent(forecastParams),
                // );

                return Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: height * 0.02,
                        ),
                        child: SizedBox(
                          width: width,
                          height: 430,
                          child: PageView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            allowImplicitScrolling: true,
                            controller: _pageController,
                            itemCount: 2,
                            itemBuilder: (context, position) {
                              if (position == 0) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 50,
                                      ),
                                      child: Text(
                                        currentCityEntity.name!,
                                        style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Text(
                                        currentCityEntity
                                            .weather![0].description!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: AppBackground.setIconForMain(
                                        currentCityEntity
                                            .weather![0].description!,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Text(
                                        "${currentCityEntity.main!.temp!.round()}\u00B0",
                                        style: const TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            const Text(
                                              "max",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${currentCityEntity.main!.tempMax!.round()}\u00B0",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: Container(
                                            color: Colors.grey,
                                            width: 2,
                                            height: 40,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            const Text(
                                              "min",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${currentCityEntity.main!.tempMin!.round()}\u00B0",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                );
                              } else {
                                return Container(
                                  color: Colors.amber,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: 2,
                          effect: const ExpandingDotsEffect(
                            dotWidth: 10,
                            dotHeight: 10,
                            spacing: 5,
                            activeDotColor: Colors.white,
                          ),
                          onDotClicked: (index) =>
                              _pageController.animateToPage(
                            index,
                            duration: const Duration(
                              microseconds: 500,
                            ),
                            curve: Curves.bounceOut,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: Container(
                          color: Colors.white24,
                          height: 2,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Center(
                              child: BlocBuilder<HomeBloc, HomeState>(
                                builder: (BuildContext context, state) {
                                  if (state.fwStatus is FwLoading) {
                                    print("==================LOADING");
                                    return const DotLoadingWidget();
                                  }

                                  if (state.fwStatus is FwCompleted) {
                                    print("==================COMPLETED");

                                    final FwCompleted fwCompleted =
                                        state.fwStatus as FwCompleted;
                                    final ForecastDayEntity forecastDayEntity =
                                        fwCompleted.forecastDayEntity;
                                    final List<Daily> mainDaily =
                                        forecastDayEntity.daily ?? [];

                                    return ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: mainDaily.length,
                                      itemBuilder: (
                                        BuildContext context,
                                        int index,
                                      ) {
                                        return DaysWeatherView(
                                          daily: mainDaily[index],
                                        );
                                      },
                                    );
                                  }

                                  if (state.fwStatus is FwError) {
                                    print("==================ERROR");

                                    final FwError fwError =
                                        state.fwStatus as FwError;

                                    return Center(
                                      child: Text(
                                        fwError.message,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }

                                  return Container();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: Container(
                          color: Colors.white24,
                          height: 2,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state.cwStatus is CwError) {
                // cast
                final CwError cwError = state.cwStatus as CwError;

                return Center(
                  child: Text(
                    cwError.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}


// class MainWrapper extends StatefulWidget {
//   const MainWrapper({super.key});
//   @override
//   State<MainWrapper> createState() => _MainWrapperState();
// }
// class _MainWrapperState extends State<MainWrapper> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<HomeBloc>(context).add(LoadCwEvent("Tehran"));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: BlocBuilder<HomeBloc, HomeState>(
//         builder: (context, state) {
//           if (state.cwStatus is CwLoading) {
//             return const Center(
//               child: Text('loading...'),
//             );
//           }
//           if (state.cwStatus is CwCompleted) {
//             // cast
//             final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
//             final CurrentCityEntity currentCityEntity =
//                 cwCompleted.currentCityEntity;
//             return Center(
//               child: Text(currentCityEntity.name ?? "-"),
//             );
//           }
//           if (state.cwStatus is CwError) {
//             return const Center(
//               child: Text('error'),
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
