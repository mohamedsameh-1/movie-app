import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/home/exploretab/explore_tab_view.dart';
import 'package:movie_app/feature/home/hometab/home_tab_view.dart';
import 'package:movie_app/feature/home/profiletab/profile_tab_view.dart';
import 'package:movie_app/feature/home/searchtab/ui/view/search_tab_view.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  int index = 0;
  List<Widget> tabsList = [
    HomeTabView(),
    SearchTabView(),
    ExploreTabView(),
    ProfileTabView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabsList[index],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.r),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: BottomNavigationBar(
            onTap: (value) {
              index = value;
              print(index);
              setState(() {});
            },
            currentIndex: index,
            items: [
              customBottomNavigationBarItem(
                icon: Icon(Icons.home),
                // currentIndex: index,
              ),
              customBottomNavigationBarItem(
                icon: Icon(Icons.search),
                // currentIndex: index,
              ),
              customBottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                // currentIndex: index,
              ),
              customBottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                // currentIndex: index,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem customBottomNavigationBarItem({
    required Widget icon,
    // required int currentIndex,
  }) => BottomNavigationBarItem(icon: icon, label: '');
}
