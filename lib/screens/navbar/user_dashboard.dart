import 'package:flutter/material.dart';
import 'package:finflex/screens/main/screen_query.dart';
import 'user_navbar.dart' as user;
import '../main/screen_about.dart';
import '../main/screen_notifications.dart';
import '../main/home_screen.dart';

class UserDashBoard extends StatelessWidget {
  UserDashBoard({Key? key}) : super(key: key);
  final _pages = [
    const HomeScreen(),
    const ScreenNotification(),
    const QueryScreen(),
    ScreenAbout(topBar: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: user.indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const user.UserNavBar(),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}
