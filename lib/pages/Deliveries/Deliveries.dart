
import 'dart:ui';


import 'package:adminposterbox/pages/Deliveries/widgets/Category.dart';
import 'package:adminposterbox/pages/Deliveries/widgets/NotificationInventoryWidget.dart';
import 'package:adminposterbox/pages/Deliveries/widgets/deliveriestable.dart';
import 'package:adminposterbox/pages/Deliveries/widgets/deliveryShort.dart';
import 'package:adminposterbox/pages/Deliveries/widgets/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../common/app_colors.dart';
import '../../common/app_responsive.dart';

import '../dashboard/widget/profile_card_widget.dart';
import '../dashboard/widget/recruitment_data_widget.dart';
import '../widget/header_widget.dart';

class DeliveriesPage extends StatelessWidget {
  const DeliveriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            /// Header Part
            HeaderWidget(text: 'Deliveres', icon1:Icons.search, icon2: Icons.send, icon3: Icons.notifications_none_rounded,),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            deliverShortWidget(),
                            SizedBox(
                              height: 20,
                            ),

                            DeliveriesTableWidget(),


                          ],
                        ),
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
