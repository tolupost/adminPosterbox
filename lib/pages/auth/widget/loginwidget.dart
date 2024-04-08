import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:adminposterbox/utils/globalvariable.dart';

class Loginwidget extends StatefulWidget {
  const Loginwidget({
    Key? key,
    required this.bottomtiles,
  }) : super(key: key);

  final List bottomtiles;

  @override
  State<Loginwidget> createState() => _LoginwidgetState();
}

class _LoginwidgetState extends State<Loginwidget> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
    'assets/Delivery.png',
    'assets/onlinepay.png',
    'assets/Delivery25.png'
  ];
  final List<Map<String, String>> onboardingContent = [
    {
      'title': 'Request Delivery',
      'subtitle': 'Make a request for your parcel to be \n sent to any state in the country',
    },
    {
      'title': 'Make Money',
      'subtitle': 'Earn while doing Deliveries to the \n Travel Destination',
    },
    {
      'title': 'Get Started',
      'subtitle': 'Make a request  for your parcel to be \n sent to any state in the country',
    },];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [

            CarouselSlider(

              options: CarouselOptions(
                  height: 500,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),



              items: imgList.asMap().entries.map((entry) {
                final int index = entry.key;
                final String imagePath = entry.value;
                final String title = onboardingContent[index]['title']!;
                final String subtitle = onboardingContent[index]['subtitle']!;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title, style: globalvariable.lgtext,textAlign: TextAlign.center),
                    ),
                    Text(subtitle, style: globalvariable.lgtext1,textAlign: TextAlign.center),
                    SizedBox(
                      width: 300,

                      child: Image.asset(imagePath,scale: 2,fit: BoxFit.cover,),
                    ),
                  ],
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : globalvariable.primarycolor)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}