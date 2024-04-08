import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../common/app_colors.dart';
import '../../common/app_responsive.dart';
import '../../controllers/menu_controller.dart';

class HeaderWidget extends StatelessWidget {

  final String text;
  final IconData icon1,icon2,icon3;
  const HeaderWidget({super.key, required this.text, required this.icon1, required this.icon2, required this.icon3});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          if (!AppResponsive.isDesktop(context))
            IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColor.black,
              ),
              onPressed: Provider.of<menuController>(context, listen: false)
                  .controlMenu,
            ),
          Text(
            text,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (!AppResponsive.isMobile(context)) ...{
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                navigationIcon(icon: icon1),
                navigationIcon(icon: icon2),
                navigationIcon(icon: icon3),
              ],
            )
          }
        ],
      ),
    );
  }

  Widget navigationIcon({icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        color: AppColor.black,
      ),
    );
  }
}
