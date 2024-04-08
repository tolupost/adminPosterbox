
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'frottedbox.dart';


class CategoryInventoryPage extends StatelessWidget {
  const CategoryInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 0.8,
            crossAxisSpacing: 35,
            mainAxisSpacing: 20),
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          final card = cards[index];
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(card.imageUrl).image),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                const Spacer(),
                FrostedGlassBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            card.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
class CardModel {
  final String imageUrl;
  final String title;
  final String subTitle;

  CardModel(this.imageUrl, this.title, this.subTitle);
}

List<CardModel> cards = [
  CardModel('assets/user1.jpg', 'Bar', 'DJ Kicks'),
  CardModel('assets/user1.jpg', 'Kitchen', 'Teenage Birdsong'),
  CardModel('assets/user1.jpg', 'Orders', 'ElRey Theartre'),
  CardModel('assets/user1.jpg', 'Utitles', 'New Rules'),

];
List<CardModel> cardss = [
  CardModel('assets/user1.jpg', 'Bar', 'DJ Kicks'),
  CardModel('assets/user1.jpg', 'Kitchen', 'Teenage Birdsong'),
  CardModel('assets/user1.jpg', 'Orders', 'ElRey Theartre'),
  CardModel('assets/user1.jpg', 'Utitles', 'New Rules'),
  CardModel('assets/user1.jpg', 'Bar', 'DJ Kicks'),
  CardModel('assets/user1.jpg', 'Kitchen', 'Teenage Birdsong'),
  CardModel('assets/user1.jpg', 'Orders', 'ElRey Theartre'),
  CardModel('assets/user1.jpg', 'Utitles', 'New Rules'),
  CardModel('assets/user1.jpg', 'Bar', 'DJ Kicks'),
  CardModel('assets/user1.jpg', 'Kitchen', 'Teenage Birdsong'),
  CardModel('assets/user1.jpg', 'Orders', 'ElRey Theartre'),
  CardModel('assets/user1.jpg', 'Utitles', 'New Rules'),
  CardModel('assets/user1.jpg', 'Bar', 'DJ Kicks'),
  CardModel('assets/user1.jpg', 'Kitchen', 'Teenage Birdsong'),
  CardModel('assets/user1.jpg', 'Orders', 'ElRey Theartre'),
  CardModel('assets/user1.jpg', 'Utitles', 'New Rules'),
  CardModel('assets/user1.jpg', 'Bar', 'DJ Kicks'),
  CardModel('assets/user1.jpg', 'Kitchen', 'Teenage Birdsong'),
  CardModel('assets/user1.jpg', 'Orders', 'ElRey Theartre'),
  CardModel('assets/user1.jpg', 'Utitles', 'New Rules'),
  CardModel('assets/user1.jpg', 'Bar', 'DJ Kicks'),
  CardModel('assets/user1.jpg', 'Kitchen', 'Teenage Birdsong'),
  CardModel('assets/user1.jpg', 'Orders', 'ElRey Theartre'),
  CardModel('assets/user1.jpg', 'Utitles', 'New Rules'),
  CardModel('assets/user1.jpg', 'Bar', 'DJ Kicks'),
  CardModel('assets/user1.jpg', 'Kitchen', 'Teenage Birdsong'),
  CardModel('assets/user1.jpg', 'Orders', 'ElRey Theartre'),
  CardModel('assets/user1.jpg', 'Utitles', 'New Rules'),
  CardModel('assets/user1.jpg', 'Bar', 'DJ Kicks'),
  CardModel('assets/user1.jpg', 'Kitchen', 'Teenage Birdsong'),
  CardModel('assets/user1.jpg', 'Orders', 'ElRey Theartre'),
  CardModel('assets/user1.jpg', 'Utitles', 'New Rules'),



];