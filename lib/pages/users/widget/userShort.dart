import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../models/user.dart';
import '../services/userservices.dart';



class userShortWidget extends StatefulWidget {
  @override
  State<userShortWidget> createState() => _userShortWidgetState();
}

class _userShortWidgetState extends State<userShortWidget> {
  List<User>? userList;
  final userservices userServices = userservices();

  @override
  void initState() {
    super.initState();
    getuser();
  }



  getuser() async {
    userList = await userServices.getUser(
      context: context, id: '', name: '', email: '',
    );
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    if (userList != null && userList!.isNotEmpty) {
      int timestamp = userList!.last.orderedAt;
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

      // Get the date portion
      DateTime dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
      String dateString = dateOnly.toIso8601String().substring(0, 10);
      return Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Users",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Details"),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            userList == null
                ? Center(child: const CircularProgressIndicator())
                : profileListTile("Number of User", userList?.length.toString()),
                  profileListTile("Last registered user", dateString),
          ],
        ),
      );
    } else {
      return Center(child: const CircularProgressIndicator());
    }

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
