import 'package:adminposterbox/models/delivery.dart';
import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../services/deliveriesservices.dart';


class deliverShortWidget extends StatefulWidget {
  @override
  State<deliverShortWidget> createState() => _deliverShortWidgetState();
}

class _deliverShortWidgetState extends State<deliverShortWidget> {
  List<Delivery>? deliveryList;
  final Deliveriesservices userServices = Deliveriesservices();

  @override
  void initState() {
    super.initState();
    fetchdeliveries();
  }



  fetchdeliveries() async {
    deliveryList = await userServices.fetchdeliveries(
      context: context, id: '', name: '', userId: '',
    );
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    if (deliveryList != null && deliveryList!.isNotEmpty) {
    int? timestamp = deliveryList?.last.orderedAt;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp!);

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
                "Deliveries",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Details"),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          profileListTile("Number of requested delivery", deliveryList?.length.toString()),
          profileListTile("Last requested delivery", dateString),

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
