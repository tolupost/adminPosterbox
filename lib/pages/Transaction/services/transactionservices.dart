import 'dart:convert';

import 'package:adminposterbox/models/transactions.dart';
import 'package:adminposterbox/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../providers/userprovider.dart';
import '../../../utils/errorHandling.dart';
import '../../../utils/globalvariable.dart';
import '../../../utils/utils.dart';

class transactionservices {
  Future<List<Transaction>> fetchTransaction({
    required BuildContext context,

  }) async {

    List<Transaction> deliveryList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/admin/allTransaction'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',

      });


      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
   print(res.body);
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            deliveryList.add(
              Transaction.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }

        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return deliveryList;
  }
}