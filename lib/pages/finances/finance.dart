import 'package:adminposterbox/pages/samples/bar/bar_chart_sample2.dart';
import 'package:adminposterbox/pages/samples/bar/bar_chart_sample3.dart';
import 'package:adminposterbox/pages/samples/bar/bar_chart_sample4.dart';

import 'package:adminposterbox/pages/samples/line/line_chart_sample6.dart';
import 'package:adminposterbox/pages/samples/pie/pie_chart_sample2.dart';

import 'package:flutter/material.dart';

import '../samples/line/line_chart_sample2.dart';

import '../widget/header_widget.dart';


class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          /// Header Part
          HeaderWidget(text: 'Inventory', icon1: Icons.search, icon2: Icons.send, icon3: Icons.notifications_none_rounded,),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(

                    child: Column(
                      children: [
                        LineChartSample2(),
                        LineChartSample6(),
                        BarChartSample2(),
                        BarChartSample3(),
                        BarChartSample4(),
                        PieChartSample2()

                      ],
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