import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class textfield extends StatelessWidget {
  final String name;
  const textfield({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return        Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(FontAwesomeIcons.mailBulk,
            size: 15,
            color: Colors.white12,),
          hintText: name,
          hintStyle: TextStyle(
            color: Colors.grey[300],
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16
          ),
          fillColor: Colors.grey,
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.transparent
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.transparent
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.transparent
              ),
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
    );
  }
}
