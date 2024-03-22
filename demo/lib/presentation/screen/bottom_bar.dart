import 'dart:io';

import 'package:demo/presentation/screen/screen_1.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final videoPath;
  const DashboardScreen({super.key, this.videoPath});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

int selectDashboard = 0;

class _DashboardScreenState extends State<DashboardScreen> {
  File? image;
  List<Widget> screen = [
    const ScreenOnePage(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exit(0);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          child: BottomNavigationBar(
              onTap: (value) {
                setState(() {});
                selectDashboard = value;
              },
              backgroundColor: const Color(0xffFFFFFF),
              selectedLabelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: const IconThemeData(color: Colors.orange),
              //unselectedItemColor: Colors.grey,
              // unselectedFontSize: 12,
              // selectedFontSize: 12,
              unselectedLabelStyle: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              currentIndex: selectDashboard,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Icon(Icons.home)),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Icon(Icons.phonelink_lock)),
                  label: "My Locker",
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Icon(Icons.drive_file_move_outlined),
                    ),
                    label: "Drive Inn"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Icon(Icons.account_box_outlined),
                    ),
                    label: "Profile"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Icon(Icons.surround_sound),
                    ),
                    label: "Refer & Eran"),
              ]),
        ),
        body: screen[selectDashboard],
      ),
    );
  }
}
