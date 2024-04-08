import 'dart:async';

import 'package:flutter/material.dart';


import '../../../common/app_colors.dart';
import '../../../models/kyc.dart';
import '../../VerifyUser/services/verifyuser.dart';

class ItemsWidget extends StatefulWidget {
  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<Kyc>? userList;
  final verifyuserservices userServices = verifyuserservices();
  ScrollController _controller =  ScrollController();
  ScrollController _controller1 =  ScrollController();
  @override
  void initState() {
    super.initState();
    getuser();
  }



  getuser() async {
    userList = await userServices.getverifyUser(
      context: context,
    );
    setState(() {});
  }
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.bgColor, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Verify Deliver",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                  fontSize: 22,
                ),
              ),
            SizedBox()
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          SingleChildScrollView(

            child:
            userList == null
                ? Center(child: const CircularProgressIndicator())
                :
            SizedBox(
              height: 700,
              child: Scrollbar(
                controller: _controller,
                child: ListView.builder(
                  physics:AlwaysScrollableScrollPhysics() ,
                  shrinkWrap: true,

                  itemCount: userList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final kyc = userList![index];

                    void acceptDeliver(){
                      setState(() {
                        isLoading = true;
                      });
                      userServices.acceptDeliver(context: context,
                          id: kyc.userId).then((value) => setState(() {
                        isLoading = false;

                      }));
                      Timer(Duration(minutes: 1), () {
                        setState(() {
                          isLoading = false;
                        });
                      });

                    }
                    void declineDeliver(){
                      setState(() {
                        isLoading = true;
                      });
                      userServices.declineDeliver(context: context,
                          id: kyc.userId).then((value) => setState(() {
                        isLoading = false;

                      }));
                      Timer(Duration(minutes: 1), () {
                        setState(() {
                          isLoading = false;
                        });
                      });

                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 500,
                        height: 300,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 300,
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: Image.network(
                                          kyc.profilepic,
                                          height: 60,
                                          width: 60,
                                        ),
                                      ),
                                      // FadeInImage(
                                      //   placeholder: AssetImage('assets/user1.jpg'),
                                      //   image: NetworkImage(kyc.profilepic),
                                      //   imageErrorBuilder: (ctx, exception, stackTrace) {
                                      //     return Container(); //THE WIDGET YOU WANT TO SHOW IF URL NOT RETURN IMAGE
                                      //   },
                                      // ),
                                      Column(
                                        children: [
                                          Text(
                                            "Name",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Text(kyc.name),
                                        ],
                                      ),

                                    ],
                                  ),
                                  Divider(
                                    thickness: 0.5,
                                    color: Colors.grey,
                                  ),
                                  profileListTile("Date of birth", kyc.dateofbirth),
                                  profileListTile("Residence", kyc.residence),
                                  profileListTile("Type", kyc.type),
                                  profileListTile("ID", kyc.number),
                                  isLoading
                                      ?Center(child: CircularProgressIndicator()):Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                        ElevatedButton(onPressed: (){acceptDeliver();}, child: Text('verify',style: TextStyle(
                                          fontWeight: FontWeight.bold, color: AppColor.black),),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:    AppColor.yellow,
                                      )),
                                           ElevatedButton(onPressed: (){declineDeliver();}, child: Text('Declined',style: TextStyle(
                                          fontWeight: FontWeight.bold, color: AppColor.black),)
                                      , style: ElevatedButton.styleFrom(
                                            backgroundColor:    Colors.red,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width:500,
                              height:260,
                              child: Image.network(
                                kyc.image,
                              fit: BoxFit.cover,
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                    // return Container(
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //       color: Colors.amber,
                    //       image: DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: Image.asset(card.imageUrl).image),
                    //       borderRadius: BorderRadius.circular(20)),
                    //   child: Column(
                    //     children: [
                    //       const Spacer(),
                    //       FrostedGlassBox(
                    //         height: 35,
                    //         width: MediaQuery.of(context).size.width,
                    //         child: ClipRRect(
                    //           borderRadius: const BorderRadius.only(
                    //               bottomLeft: Radius.circular(20),
                    //               bottomRight: Radius.circular(20)),
                    //           child: Center(
                    //             child: Column(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Text(
                    //                   card.title,
                    //                   style: const TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 10,
                    //                       fontWeight: FontWeight.w600),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 5,
                    //                 ),
                    //                 Text(
                    //                   card.subTitle,
                    //                   style: const TextStyle(
                    //                       color: Colors.white60,
                    //                       fontSize: 8,
                    //                       fontWeight: FontWeight.w300),
                    //                 ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
