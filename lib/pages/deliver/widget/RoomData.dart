import 'package:adminposterbox/pages/widget/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';
import '../../../models/user.dart';
import '../services/deliverservices.dart';


class RoomDataWidget extends StatefulWidget {
  @override
  _RoomDataWidgetState createState() => _RoomDataWidgetState();
}

class _RoomDataWidgetState extends State<RoomDataWidget> {
  List<User>? userList;
  final deliverservices userServices = deliverservices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  ScrollController _controller =  ScrollController();
  ScrollController _controller1 =  ScrollController();
  @override
  void initState() {
    super.initState();
    getuser();
  }



  getuser() async {
    userList = await userServices.fetchCategoryProducts(
      context: context, id: _idController.text, name: _nameController.text, email: _emailController.text,
    );
    setState(() {});
  }
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _idController.dispose();
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
                  "Deliver",
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

                          hintText: "Email",
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
                      getuser();
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
              controller: _controller,
              child: SingleChildScrollView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 1500,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(

                          children: [
                            SizedBox(width: 10,),
                            tableHeader('Full Name'),
                            SizedBox(width: 130,),
                            tableHeader('email'),
                            SizedBox(width: 140,),
                            tableHeader('phone'),
                            SizedBox(width: 70,),
                            tableHeader('wallet'),
                            SizedBox(width: 50,),
                            tableHeader('CreatedAt'),
                            SizedBox(width: 30,),
                            tableHeader('Kyc:Name'),
                            SizedBox(width: 80,),
                            tableHeader('DOB'),
                            SizedBox(width: 50,),
                            tableHeader('Id'),
                            SizedBox(width: 250,),
                            tableHeader('deliveriesDone'),

                          ],
                        ),

                      ),
                      userList == null
                          ? Center(child: const CircularProgressIndicator())
                          :SizedBox(
                        height: 400,
                          child: Scrollbar(
                            controller: _controller1,
                            child: ListView.builder(
                              controller: _controller1,
                            shrinkWrap: true,
                            itemCount: userList!.length,
                            itemBuilder:(context, index) {

                              final user = userList![index];
                              final name = user.kyc[0]['name'];
                              final Dob = user.kyc[0]['dateofbirth'];
                              final to = user.schedule![index]['to'];
                              final from = user.schedule![index]['from'];
                              final date = user.schedule![index]['time'];
                              final image = user.kyc[0]['image'];

                              int timestamp = user.orderedAt;
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
                                  ExpansionTile(leading: SizedBox(width:180,child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.network(
                                          user.image,
                                          height: 60,
                                          width: 60,
                                        ),
                                      ),
                                      Text(user.name,overflow: TextOverflow.fade),
                                    ],
                                  )),title: ( Row(
                                    children: [

                                      SizedBox(width: 180,
                                        child:    Text(user.email,overflow: TextOverflow.fade),),

                                      SizedBox(width: 117,
                                        child:   Text(user.phone),),

                                      SizedBox(width: 90,
                                        child:    Text(user.wallet.toString()),),


                                      SizedBox(width: 108,child: Text( dateString)),
                                      SizedBox(width: 150,
                                        child:    Text(   name),),

                                      SizedBox(width: 80,
                                        child:   Text(Dob),),

                                      SizedBox(width: 260,
                                        child:    Text(user.id),),

                                      SizedBox(width: 160,child: Text(
                                          'deliveriesDone: ${user.deliveriesDone.toString()}')),



                                    ],
                                  )),

                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [


                                          SizedBox(height: 5,),
                                          SizedBox(
                                            height: 50,
                                            child: ListView.builder(
                                              itemCount: user.schedule!.length,
                                              itemBuilder: (BuildContext context, int index) {
                                              return  Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  SizedBox(width: 150,
                                                    child:   Text('Schedule To:${to}'),),

                                                  SizedBox(width: 120,
                                                    child:    Text('from:${from}'),),






                                                  SizedBox(width: 120,child: Text(date.toString())),
                                                ],
                                              );
                                            },),
                                          ),
                                          SizedBox(
                                            width:500,
                                            height:260,
                                            child: Image.network(
                                               image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),


                                        ],
                                      )
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
