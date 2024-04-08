import 'dart:convert';

import 'package:adminposterbox/models/transactions.dart';
import 'package:adminposterbox/models/user.dart';
import 'package:adminposterbox/models/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../providers/userprovider.dart';
import '../../../utils/errorHandling.dart';
import '../../../utils/globalvariable.dart';
import '../../../utils/utils.dart';

class withdrawservices {
  Future<List<Withdraw>> fetchWithdraw({
    required BuildContext context,

  }) async {

    List<Withdraw> deliveryList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/admin/allWithdraw'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',

      });


      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
print(res.body);
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            deliveryList.add(
              Withdraw.fromJson(
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
  acceptWithdraw({
    required BuildContext context,
    required String id,


  }) async {

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/paid'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',

        },
        body: jsonEncode({
          'id': id,
        }),

      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {

          showSnackBar(context, 'Withdraw request created Accepted!');


        },

      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}