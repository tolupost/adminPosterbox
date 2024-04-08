
import 'package:adminposterbox/pages/users/widget/staff_data.dart';
import 'package:adminposterbox/pages/users/widget/userShort.dart';
import 'package:flutter/material.dart';



import '../../common/app_colors.dart';
import '../../common/app_responsive.dart';
import '../dashboard/widget/calender_widget.dart';
import '../dashboard/widget/profile_card_widget.dart';
import '../dashboard/widget/recruitment_data_widget.dart';
import '../widget/header_widget.dart';


class userPage extends StatelessWidget {
  const userPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          /// Header Part
          HeaderWidget(text: 'Users', icon1:Icons.search, icon2: Icons.send, icon3: Icons.notifications_none_rounded,),
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
                          userShortWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          userWidget(),
                          SizedBox(
                            height: 20,
                          ),


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