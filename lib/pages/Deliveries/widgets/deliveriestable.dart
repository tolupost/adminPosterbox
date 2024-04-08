import 'package:adminposterbox/models/delivery.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';
import '../services/deliveriesservices.dart';


class DeliveriesTableWidget extends StatefulWidget {
  @override
  _DeliveriesTableWidgetState createState() => _DeliveriesTableWidgetState();
}

class _DeliveriesTableWidgetState extends State<DeliveriesTableWidget> {
  List<Delivery>? deliveriesList;
  final Deliveriesservices DeliveriesServices = Deliveriesservices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  ScrollController _controller =  ScrollController();
  ScrollController _controller1 =  ScrollController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _idController.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchdeliveries();
  }



  fetchdeliveries() async {
    deliveriesList = await DeliveriesServices.fetchdeliveries(
      context: context, id: _idController.text, name: _nameController.text, userId: _emailController.text,
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
                  "Deliveries",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                    fontSize: 22,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(

                          hintText: "userId",
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16
                          ),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: TextField(
                        controller: _nameController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(

                          hintText: "Name",
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16
                          ),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: TextField(
                        controller: _idController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(

                          hintText: "ID",
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16
                          ),
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            backgroundColor: AppColor.yellow
                        ),
                        onPressed: (){
                          fetchdeliveries();
                        }, child: Text('Search'))
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            Scrollbar(
              controller: ScrollController(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                physics: AlwaysScrollableScrollPhysics(),
                dragStartBehavior: DragStartBehavior.start,
                child: SizedBox(
                  width: 1200,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(

                          children: [
                            SizedBox(width: 10,),
                            tableHeader('fee'),
                            SizedBox(width: 50,),
                            tableHeader('Deliver'),
                            SizedBox(width: 50,),
                            tableHeader('timeline'),
                            SizedBox(width: 50,),
                            tableHeader('weight'),
                            SizedBox(width: 50,),
                            tableHeader('CreatedAt'),
                            SizedBox(width: 50,),
                            tableHeader('progress'),
                            SizedBox(width: 95,),
                            tableHeader('deliverId'),
                            SizedBox(width: 175,),
                            tableHeader('Id'),



                          ],
                        ),

                      ),
                      deliveriesList == null
                          ? Center(child: const CircularProgressIndicator())
                          :SizedBox(
                        height: 400,
                           child: Scrollbar(
                             controller: _controller,
                             child: ListView.builder(
                               controller: _controller,
                          shrinkWrap: true,
                          itemCount: deliveriesList?.length,
                          itemBuilder:(context, index) {
                              final deliveries = deliveriesList![index];
                              int timestamp = deliveries.orderedAt;
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
                                  ExpansionTile(leading: SizedBox(width:55,child:
                                      Text(deliveries.deliveryfee),

                                  ),title: ( Row(
                                    children: [

                                      SizedBox(width: 100,
                                        child:    Text(deliveries.username),),

                                      SizedBox(width: 104,
                                        child:   Text(
                                                   "${deliveries.deliverytimeline} days"),),

                                      SizedBox(width: 100,
                                        child:    Text(deliveries.deliveryweight),),


                                      SizedBox(width: 120,child: Text(dateString)),
                                      SizedBox(width: 120,
                                        child:    Text(deliveries.progress),),

                                      SizedBox(width: 230,
                                        child:   Text(deliveries.deliverId),),

                                      SizedBox(width: 230,
                                        child:    Text(deliveries.id!),),



                                    ],
                                  )),

                                    children: [


                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Text('The delivery was made by ${deliveries.sendername} '
                                                'from ${deliveries.state1}, ${deliveries.senderaddress} '
                                                'with number ${deliveries.sendernumber}'
                                                ' to be delivered to ${deliveries.receviername} '
                                                'from ${deliveries.state2}, ${deliveries.recevieraddress} '
                                                'with number ${deliveries.receviernumber}'),
                                          ),





                                    ],),

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
