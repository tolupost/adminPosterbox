import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../models/withdraw.dart';

import '../services/withdrawservices.dart';


class withdrawShortWidget extends StatefulWidget {
  @override
  State<withdrawShortWidget> createState() => _withdrawShortWidgetState();
}

class _withdrawShortWidgetState extends State<withdrawShortWidget> {
  List<Withdraw>? withdrawList;
  final withdrawservices withdrawServices = withdrawservices();

  @override
  void initState() {
    super.initState();
    getuser();
  }



  getuser() async {
    withdrawList = await withdrawServices.fetchWithdraw(
      context: context,
    );
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    if (withdrawList != null && withdrawList!.isNotEmpty) {

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
          withdrawList == null
              ? Center(child: const CircularProgressIndicator())
              : profileListTile("Number of Withdraw", withdrawList?.length.toString()),


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
