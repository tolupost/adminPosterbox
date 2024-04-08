import 'package:flutter/material.dart';

import '../../common/app_colors.dart';


class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Posterbox",
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              icon: "assets/menu_home.png",
              press: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            DrawerListTile(
              title: "Users",
              icon: "assets/menu_recruitment.png",
              press: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            DrawerListTile(
              title: "Deliveries",
              icon: "assets/menu_onboarding.png",
              press: () {
                setState(() {
                  index = 2;
                });
              },
            ),
            DrawerListTile(
              title: "deliver",
              icon: "assets/menu_report.png",
              press: () {
                setState(() {
                  index = 3;
                });
              },
            ),

            DrawerListTile(
              title: "Verify User",
              icon: "assets/menu_calendar.png",
              press: () {
                setState(() {
                  index = 4;
                });
              },
            ),
            DrawerListTile(
              title: "Finances",
              icon: "assets/menu_report.png",
              press: () {
                setState(() {
                  index = 5;
                });
              },
            ),
            DrawerListTile(
              title: "Settings",
              icon: "assets/menu_settings.png",
              press: () {
                setState(() {
                  index = 6;
                });
              },
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, icon;
  final VoidCallback press;

  const DrawerListTile({Key? key, required this.title, required this.icon, required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        icon,
        color: AppColor.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
