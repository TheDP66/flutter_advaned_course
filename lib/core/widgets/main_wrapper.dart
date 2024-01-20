import 'package:flutter/material.dart';
import 'package:flutter_advaned_course/core/widgets/app_background.dart';
import 'package:flutter_advaned_course/core/widgets/bottom_nav.dart';
import 'package:flutter_advaned_course/features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import 'package:flutter_advaned_course/features/feature_weather/presentation/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget = [
      const HomeScreen(),
      const BookMarkScreen(),
    ];

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      /// extend body until under bottom navigation
      extendBody: true,
      bottomNavigationBar: BottomNav(
        controller: pageController,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppBackground.getBackGroundImage(),
            fit: BoxFit.cover,
          ),
        ),
        height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
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
