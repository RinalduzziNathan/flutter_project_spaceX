import 'package:flutter/material.dart';
import 'package:flutter_project/manager/api_manager.dart';
import 'package:flutter_project/manager/database_manager.dart';
import 'package:flutter_project/manager/launch_manager.dart';
import 'package:flutter_project/model/launch.dart';
import 'package:flutter_project/view/favoriteLaunchList.dart';
import 'package:flutter_project/view/pastLaunches.dart';
import 'package:flutter_project/view/placeholderView.dart';
import 'package:flutter_project/view/upcomingLaunches.dart';
import 'package:flutter_project/view_model/upcoming_launchesvm.dart';
import 'package:provider/provider.dart';

import 'favoriteLaunches.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return
            Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          bottomNavigationBar: BottomNavigationBar(

            selectedItemColor: Colors.blueGrey,
            selectedLabelStyle: TextStyle(color: Colors.blueGrey),
            items: const [
              BottomNavigationBarItem(
                  label: "Launches",
                  icon: Icon(Icons.watch_later_sharp,color: Colors.orange),
                  activeIcon: Icon(
                    Icons.watch_later_sharp,
                    color: Colors.orangeAccent,
                  )),
              BottomNavigationBarItem(
                  label: "Favs",
                  icon: Icon(Icons.favorite_border, color: Colors.pinkAccent),
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  label: "Past launches",
                  icon: Icon(Icons.youtube_searched_for_rounded,color: Colors.green,),
                  activeIcon: Icon(
                    Icons.youtube_searched_for_sharp,
                    color: Colors.lightGreenAccent,
                  )),
              BottomNavigationBarItem(
                  label: "Map",

                  icon: Icon(Icons.map,color: Colors.grey,),
                  activeIcon: Icon(
                    Icons.map,
                    color: Colors.blueGrey,
                  ))
            ],
            currentIndex: _currentIndex,
            onTap: (newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
              _pageController.animateToPage(_currentIndex,
                  duration: kThemeAnimationDuration, curve: Curves.ease);
            },
          ),
          body: PageView(
            controller: _pageController,
            children: [
              ViewUpcomingLaunches(),
              ViewFavoriteLaunches(),
              ViewPastLaunches(),
              PlaceHolderView(),
            ],
          ),
        );

  }
}
