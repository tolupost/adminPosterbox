import 'package:adminposterbox/models/user.dart';
import 'package:adminposterbox/pages/users/services/userservices.dart';
import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';



class userWidget extends StatefulWidget {
  @override
  _userWidgetState createState() => _userWidgetState();
}

class _userWidgetState extends State<userWidget> {
  List<User>? userList;
  final userservices userServices = userservices();
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
    getuser();
  }



  getuser() async {
   userList = await userServices.getUser(
      context: context, id: _idController.text, name: _nameController.text, email: _emailController.text,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Users",
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
            thumbVisibility: true,
            controller: _controller,

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              child: SizedBox(
                width: 1000,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(

                        children: [
                          SizedBox(width: 10,),
                          tableHeader('Full Name'),
                          SizedBox(width: 80,),
                          tableHeader('email'),
                          SizedBox(width: 140,),
                          tableHeader('phone'),
                          SizedBox(width: 70,),
                          tableHeader('wallet'),
                          SizedBox(width: 50,),
                          tableHeader('CreatedAt'),
                          SizedBox(width: 50,),
                          tableHeader('Id'),


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
                              itemCount: userList?.length,
                              itemBuilder: (context, index){

                              final user = userList![index];

                              int timestamp = user.orderedAt;
                              DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Get the date portion
                                DateTime dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
                                String dateString = dateOnly.toIso8601String().substring(0, 10);
                              return

                              Column(
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
                                ExpansionTile(leading: SizedBox(width:130,child:

                                    Text(user.name),
                                ),title: ( Row(
                                  children: [

                                    SizedBox(width: 180,
                                      child:    Text(user.email),),

                                    SizedBox(width: 117,
                                      child:   Text(user.phone),),

                                    SizedBox(width: 90,
                                      child:    Text(user.wallet.toString()),),


                                    SizedBox(width: 120,child: Text( dateString)),


                                    SizedBox(width: 240,
                                      child:    Text(user.id),),



                                  ],
                                )),
),

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
