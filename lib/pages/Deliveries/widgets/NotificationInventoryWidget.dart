import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';


class NotificationInventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  "assets/user1.jpg",
                  height: 40,
                  width: 40,
                ),
              ),
              SizedBox(width: 5),
              Column(
                children: [
                  Text(
                    "Employee",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,),
                  ),
                  Text("Subject",style: TextStyle(
                    fontSize: 12,
                  ),),
                ],
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Text("Message",style: TextStyle(
            fontSize: 12,
          ), )
        ],
      ),
    );
  }


}
