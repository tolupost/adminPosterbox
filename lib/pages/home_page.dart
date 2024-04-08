
import 'package:adminposterbox/pages/users/users.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import '../common/app_colors.dart';
import '../common/app_responsive.dart';
import '../controllers/menu_controller.dart';
import 'Deliveries/Deliveries.dart';
import 'Transaction/transaction.dart';
import 'VerifyUser/VerifyUser.dart';
import 'Withdraw/withdraw.dart';
import 'dashboard/dashboard.dart';
import 'deliver/deliver.dart';
import 'widget/side_bar_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Posterbox",
                      style: TextStyle(
                        color: AppColor.yellow,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(onPressed:(){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios,color: AppColor.yellow,))
                  ],
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
                title: "Withdraws",
                icon: "assets/menu_report.png",
                press: () {
                  setState(() {
                    index = 5;
                  });
                },
              ),
              DrawerListTile(
                title: "Transactions",
                icon: "assets/menu_report.png",
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
      ),
      key: Provider.of<menuController>(context, listen: false).scaffoldKey,
      backgroundColor:Colors.transparent,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if (AppResponsive.isDesktop(context))
              Expanded(
                child: Drawer(
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
                          title: "Withdraws",
                          icon: "assets/menu_report.png",
                          press: () {
                            setState(() {
                              index = 5;
                            });
                          },
                        ),
                        DrawerListTile(
                          title: "Transactions",
                          icon: "assets/menu_report.png",
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
                ),
              ),

            /// Main Body Part

            Expanded(
              flex: 4,
              child: Builder(builder: (BuildContext context) {
                if (index == 0){
                  return Dashboard();
                }
                if (index == 1){
                  return userPage();
                }
                if (index == 2){
                  return DeliveriesPage();
                }
                if (index == 3){
                  return deliverPage();
                }
                if (index == 4){
                  return VerifyUserPage();
                }
                if (index == 5){
                  return WithdrawPage();
                }
                if (index == 6){
                  return TransactionPage();
                }
                return Dashboard();
              },),
            ),
          ],
        ),
      ),
    );
  }
}
