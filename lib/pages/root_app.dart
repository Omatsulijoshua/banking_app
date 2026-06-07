import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:banking_app/pages/dashboard_page.dart';
import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0; // <-- pageIndex must be a field of the state class

  void selectedTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedTab(4);
        },
        backgroundColor: primary,
        child: const Icon(Icons.credit_card, size: 25),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex, // <-- now it's valid
      children: [
        DashbaordPage(),
        Center(child: Text("Chat Page")),
        Center(child: Text("Notification Page")),
        Center(child: Text("Account Page")),
        Center(child: Text("Card Page")),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
     MaterialCommunityIcons.view_grid,
      MaterialCommunityIcons.comment,
      MaterialCommunityIcons.bell,
     MaterialCommunityIcons.account_circle
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex, // <-- now it's valid
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      iconSize: 25,
      onTap: (index) {
        selectedTab(index); // <-- now works
      },
    );
  }
}
