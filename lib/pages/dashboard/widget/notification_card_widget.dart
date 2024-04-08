import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../models/delivery.dart';
import '../../../models/kyc.dart';
import '../../../models/user.dart';
import '../../Deliveries/services/deliveriesservices.dart';
import '../../VerifyUser/services/verifyuser.dart';
import '../../users/services/userservices.dart';


class NotificationCardWidget extends StatefulWidget {
  @override
  State<NotificationCardWidget> createState() => _NotificationCardWidgetState();
}

class _NotificationCardWidgetState extends State<NotificationCardWidget> {
  List<Kyc>? userverifyList;
  final userservices userServices = userservices();

  @override
  void initState() {
    super.initState();
    getuser();
    fetchdeliveries();
    getverifyuser();
  }

  List<User>? userList;
  final verifyuserservices userverifyServices = verifyuserservices();



  getverifyuser() async {
    userverifyList = await userverifyServices.getverifyUser(
      context: context,
    );
    setState(() {});
  }

  getuser() async {
    userList = await userServices.getUser(
      context: context, id: '', name: '', email: '',
    );
    setState(() {});
  }
  List<Delivery>? deliveryList;
  final Deliveriesservices dserServices = Deliveriesservices();





  fetchdeliveries() async {
    deliveryList = await dserServices.fetchdeliveries(
      context: context, id: '', name: '', userId: '',
    );
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    int length = 0;
    if(userverifyList != null && userverifyList!.isNotEmpty  ){
      setState(() {
       length = userverifyList!.length;
      });
    }
    print(userList);
    print(userverifyList);
    print(deliveryList);
    if ( userList != null && userList!.isNotEmpty && deliveryList != null && deliveryList!.isNotEmpty) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.yellow, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 16, color: AppColor.black),
                  children: const [
                    TextSpan(text: "Good Morning "),
                    TextSpan(
                      text: "Abmin!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Today you have ${userList!.length} Users.\nAlso you have  ${deliveryList!.length} deliveries and ${length}\nDelivers to verify",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.black,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Read More",
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
          if (MediaQuery.of(context).size.width >= 620) ...{
            Spacer(),

          }
        ],
      ),
    );

  } else {
  return Center(child: const CircularProgressIndicator());
  }
  }
}
