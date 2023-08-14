import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phi/screen/dashboard/bookmark_screen.dart';
import 'package:phi/screen/dashboard/home_screen.dart';
import 'package:phi/screen/dashboard/notification_screen.dart';
import 'package:phi/screen/dashboard/profile_screen.dart';
import 'package:phi/utils/all_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> page = [
    HomeScreen(),
    BookmarkScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
 List<Image>images=[

 ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: page,
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedIconTheme: IconThemeData(color: AllColors.black),
        //backgroundColor: AllColors.blue,
        selectedItemColor: AllColors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
BottomNavigationBarItem(icon: SvgPicture.asset(CustomIcon.home),label: ""),
          BottomNavigationBarItem(icon: SvgPicture.asset(CustomIcon.bell),label: "g"),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/bookmark.svg'),label: 's'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: "")
        ],
      ),
    );
  }
}
class CustomIcon{
  static const String home="assets/home.svg";
  static const String bell="assets/bell.svg";

}