import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../models/user.dart';
import '../services/deliverservices.dart';


class BookingWidget extends StatefulWidget {
  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {

  List<User>? userList;
  final deliverservices userServices = deliverservices();

  @override
  void initState() {
    super.initState();
    getuser();
  }



  getuser() async {
    userList = await userServices.fetchCategoryProducts(
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
                "Customer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Room Number"),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          userList == null
              ? Center(child: const CircularProgressIndicator())
              : profileListTile("Number of deliver", userList?.length.toString()),
                profileListTile("Last registered deliver", dateString),

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
