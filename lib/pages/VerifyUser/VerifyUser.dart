
import 'package:adminposterbox/pages/VerifyUser/widgets/calenderWidget.dart';
import 'package:flutter/material.dart';


import '../../common/app_colors.dart';
import '../../common/app_responsive.dart';
import '../Deliveries/widgets/Category.dart';
import '../Deliveries/widgets/NotificationInventoryWidget.dart';
import '../Deliveries/widgets/items.dart';
import '../dashboard/widget/calender_widget.dart';
import '../dashboard/widget/profile_card_widget.dart';
import '../widget/header_widget.dart';

class VerifyUserPage extends StatelessWidget {
  const VerifyUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          /// Header Part
          HeaderWidget(text: 'Inventory', icon1: Icons.search, icon2: Icons.send, icon3: Icons.notifications_none_rounded,),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(

                    child: Column(
                      children: [



                        ItemsWidget(),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}