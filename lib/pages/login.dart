import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../common/app_responsive.dart';
import '../controllers/menu_controller.dart';
import 'auth/widget/loginDetails.dart';
import 'auth/widget/loginwidget.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    List bottomtiles = ['home','Rooms','Appointments', 'Inventory','Employees',];

    return Scaffold(
      key: Provider.of<menuController>(context, listen: false).scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Row(
          children: [
            if (AppResponsive.isDesktop(context)||(AppResponsive.isTablet(context)))
            Expanded(
              flex: 2,
              child: Loginwidget(bottomtiles: bottomtiles),
            ),
            Expanded(
              child: logindetails(),
            ),
          ]
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}



