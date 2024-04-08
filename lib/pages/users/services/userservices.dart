import 'dart:convert';

import 'package:adminposterbox/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../providers/userprovider.dart';
import '../../../utils/errorHandling.dart';
import '../../../utils/globalvariable.dart';
import '../../../utils/utils.dart';

class userservices {
  Future<List<User>> getUser({
    required BuildContext context,
    required String id,
    required String name,
    required String email
  }) async {

    List<User> userList = [];
    try {
      http.Response res = await http
          .post(Uri.parse('$uri/admin/allUser'),
          body: jsonEncode({
            'name':name,
            'id': id,
            'email': email
          }),
          headers: {
        'Content-Type': 'application/json; charset=UTF-8',

      });


      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {

          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            userList.add(
              User.fromJson(
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
    return userList;
  }
}