import 'package:flutter/material.dart';


import '../../../common/app_colors.dart';
import '../../../models/user.dart';
import '../../widget/textfeild.dart';
import '../services/deliverservices.dart';


class PlaceBookingWidget extends StatefulWidget {
  @override
  State<PlaceBookingWidget> createState() => _PlaceBookingWidgetState();
}

class _PlaceBookingWidgetState extends State<PlaceBookingWidget> {

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Book Room",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),

          textfield(name: "Customer"),

          textfield(name: "Date"),
          textfield(name: "Time"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(16),
              ),
              onPressed: (){

              },
              child: Text("Place Booking",style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.black
              ),))


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
