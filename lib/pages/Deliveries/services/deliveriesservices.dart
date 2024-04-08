import 'dart:convert';

import 'package:adminposterbox/models/delivery.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../utils/errorHandling.dart';
import '../../../utils/globalvariable.dart';
import '../../../utils/utils.dart';

class Deliveriesservices {
  Future<List<Delivery>> fetchdeliveries({
    required BuildContext context,
    required String id,
    required String name,
    required String userId

  }) async {
    List<Delivery> deliveryList = [];
    try {
      http.Response res = await http
          .post(Uri.parse('$uri/admin/get-deliveries'),
          body: jsonEncode({
            'name':name,
            'id': id,
            'userId': userId
          }),
          headers: {
        'Content-Type': 'application/json; charset=UTF-8',

      });


      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {

          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            deliveryList.add(
              Delivery.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }

        },
      );
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return deliveryList;
  }
}