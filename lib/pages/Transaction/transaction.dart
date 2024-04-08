
import 'package:adminposterbox/pages/Transaction/widget/TransactionShort.dart';
import 'package:adminposterbox/pages/Transaction/widget/transaction.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../widget/header_widget.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          /// Header Part
          HeaderWidget(text: 'Transaction', icon1:Icons.search, icon2: Icons.send, icon3: Icons.notifications_none_rounded,),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          transactionShortWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          transactionWidget(),
                          SizedBox(
                            height: 20,
                          ),


                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}