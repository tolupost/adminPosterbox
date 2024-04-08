import 'dart:convert';

import 'package:adminposterbox/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../models/kyc.dart';
import '../../../providers/userprovider.dart';
import '../../../utils/errorHandling.dart';
import '../../../utils/globalvariable.dart';
import '../../../utils/utils.dart';

class verifyuserservices {
  Future<List<Kyc>> getverifyUser({
    required BuildContext context,

  }) async {

    List<Kyc> userList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/admin/allunverifiedUser'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',

      });


      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
        print(res.body);
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            userList.add(
              Kyc.fromJson(
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
    return userList;
  }
  acceptDeliver({
    required BuildContext context,
    required String id,


  }) async {

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/verifyUser'),
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

          showSnackBar(context, 'Delivery request created Accepted!');


        },

      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  declineDeliver({
    required BuildContext context,
    required String id,


  }) async {

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/reset-kyc'),
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

          showSnackBar(context, 'Delivery request created Accepted!');


        },

      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}