import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';
import '../../../models/withdraw.dart';
import '../services/withdrawservices.dart';


class withdrawWidget extends StatefulWidget {
  @override
  _withdrawWidgetState createState() => _withdrawWidgetState();
}

class _withdrawWidgetState extends State<withdrawWidget> {
  List<Withdraw>? withdrawList;
  final withdrawservices withdrawServices = withdrawservices();
  ScrollController _controller =  ScrollController();
  ScrollController _controller1 =  ScrollController();
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
  bool isLoading = false;


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
                  "withdraws",
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
              controller: _controller,
              child: SingleChildScrollView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 1100,
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
                            tableHeader('type'),
                            SizedBox(width: 60,),
                            tableHeader('userId'),
                            SizedBox(width: 180,),
                            tableHeader('paid'),
                            SizedBox(width: 15,),
                            tableHeader('amount'),
                            SizedBox(width: 20,),



                          ],
                        ),

                      ),
                      withdrawList == null
                          ? Center(child: const CircularProgressIndicator())
                          :
                      SizedBox(
                        height: 400,
                        child: Scrollbar(
                          controller: _controller1,
                          child: ListView.builder(
                            controller: _controller1,
                            shrinkWrap: true,
                            itemCount: withdrawList!.length,
                            itemBuilder:(context, index) {
                              final withdraw = withdrawList![index];



                              void acceptWithdraw(){
                              print( withdraw.id) ;
                                setState(() {
                                  isLoading = true;
                                });
                                withdrawServices.acceptWithdraw(context: context,
                                    id: withdraw.id!).then((value) => setState(() {
                                  isLoading = false;

                                }));
                                Timer(Duration(minutes: 1), () {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });

                              }
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
                                          child:    Text(withdraw.username),),

                                        SizedBox(width: 110,
                                          child:   Text(withdraw.account),),




                                        SizedBox(width: 97,child: Text(withdraw.name)),
                                        SizedBox(width: 220,
                                          child:    Text(withdraw.userId),),
                                        SizedBox(width: 50,
                                          child:    Text(withdraw.paid),),
                                        SizedBox(width: 50,
                                          child:    Text(withdraw.amount.toString()),),
                                        if(withdraw.paid == 'false')
                                        SizedBox(width: 140,
                                          child:      ElevatedButton(onPressed: (){acceptWithdraw();}, child: Text('paid',style: TextStyle(
                                              fontWeight: FontWeight.bold, color: AppColor.black),),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:    AppColor.yellow,
                                              )),),





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
