import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';


class ProfileCardWidget extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  "assets/user1.jpg",
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Admin"),
                ],
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          profileListTile("Event Date", "18-Apr-2021"),
          profileListTile("ToDo", "32"),
          profileListTile("Income Items", "125"),

        ],
      ),
    );
  }

  Widget profileListTile(text, value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Text(
            value,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
          ),
        ],
      ),
    );
  }
}
