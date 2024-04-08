import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';
import '../../../models/transactions.dart';
import '../services/transactionservices.dart';


class transactionWidget extends StatefulWidget {
  @override
  _transactionWidgetState createState() => _transactionWidgetState();
}

class _transactionWidgetState extends State<transactionWidget> {
  List<Transaction>? transactionList;
  final transactionservices transactionServices = transactionservices();
  ScrollController _controller =  ScrollController();
  ScrollController _controller1 =  ScrollController();
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

    return SingleChildScrollView(

      child: Container(
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                    fontSize: 22,
                  ),
                ),
           SizedBox(),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            Scrollbar(
              controller: _controller1,
              child: SingleChildScrollView(
                controller: _controller1,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 1000,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(

                          children: [
                            SizedBox(width: 10,),
                            tableHeader('username'),
                            SizedBox(width: 80,),
                            tableHeader('cost'),
                            SizedBox(width: 80,),
                            tableHeader('createdAt'),
                            SizedBox(width: 70,),
                            tableHeader('type'),
                            SizedBox(width: 60,),
                            tableHeader('userId'),
                            SizedBox(width: 20,),



                          ],
                        ),

                      ),
                      transactionList == null
                          ? Center(child: const CircularProgressIndicator())
                          :
                      SizedBox(
                        height: 400,
                        child: Scrollbar(
                          controller: _controller,
                          child: ListView.builder(
                            controller: _controller,
                            shrinkWrap: true,
                            itemCount: transactionList!.length,
                            itemBuilder:(context, index) {
                              final transaction = transactionList![index];

                              int timestamp = transaction.orderedAt;
                              DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

// Get the date portion
                              DateTime dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
                              String dateString = dateOnly.toIso8601String().substring(0, 10);

                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey,
                                            width: 0.5,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                                    child: Row(
                                      children: [

                                        SizedBox(width: 150,
                                          child:    Text(transaction.username),),

                                        SizedBox(width: 110,
                                          child:   Text(transaction.cost),),

                                        SizedBox(width: 140,
                                          child:    Text(dateString),),


                                        SizedBox(width: 97,child: Text(transaction.type)),
                                        SizedBox(width: 140,
                                          child:    Text(transaction.userId),),





                                      ],
                                    ),
                                  )

                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  TableRow tableRow(context, {name, image, designation, status, color}) {
    return TableRow(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        children: [
          //Full Name
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(name),
          ),
          // Designation
          if (!AppResponsive.isMobile(context)) Text(designation),
          //Status
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                height: 10,
                width: 10,
              ),
              SizedBox(
                width: 10,
              ),
              Text(status),
            ],
          ),
          // Menu icon
          if (!AppResponsive.isMobile(context))
            Image.asset(
              "assets/more.png",
              color: Colors.grey,
              height: 30,
            )
        ]);
  }

  Widget tableHeader(text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
      ),
    );
  }
}
