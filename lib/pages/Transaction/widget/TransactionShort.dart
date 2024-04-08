import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../models/transactions.dart';
import '../services/transactionservices.dart';


class transactionShortWidget extends StatefulWidget {
  @override
  State<transactionShortWidget> createState() => _transactionShortWidgetState();
}

class _transactionShortWidgetState extends State<transactionShortWidget> {
  List<Transaction>? transactionList;
  final transactionservices transactionServices = transactionservices();

  @override
  void initState() {
    super.initState();
    getuser();
  }



  getuser() async {
    transactionList = await transactionServices.fetchTransaction(
      context: context,
    );
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    if (transactionList != null && transactionList!.isNotEmpty) {
      int timestamp = transactionList!.last.orderedAt;
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
          transactionList == null
              ? Center(child: const CircularProgressIndicator())
              : profileListTile("Number of User", transactionList?.length.toString()),
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
