
import 'package:adminposterbox/pages/deliver/widget/Booking.dart';
import 'package:adminposterbox/pages/deliver/widget/RoomData.dart';
import 'package:adminposterbox/pages/deliver/widget/placeBooking.dart';
import 'package:flutter/material.dart';


import '../../common/app_colors.dart';
import '../../common/app_responsive.dart';
import '../dashboard/widget/recruitment_data_widget.dart';
import '../widget/header_widget.dart';

class deliverPage extends StatelessWidget {
  const deliverPage({super.key});

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
            HeaderWidget(text: 'Deliver', icon1:Icons.search, icon2: Icons.send, icon3: Icons.notifications_none_rounded,),
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
                          BookingWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          RoomDataWidget(),



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