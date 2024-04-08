import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../controllers/menu_controller.dart';
import '../../../providers/userprovider.dart';
import '../../../utils/errorHandling.dart';
import '../../../utils/globalvariable.dart';
import '../../../utils/utils.dart';
import '../../home_page.dart';


class AuthService {
  // sign up user
  signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String code,

  }) async {
    try {


      http.Response res = await http.post(
        Uri.parse('$uri/admin/signup'),
        body: jsonEncode({
          'name':name,
          'email': email,
          'password': password,
          'code':code
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {

          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // sign in user
  signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (context) => menuController()),
                  ],
                  child: HomePage(),
                ),
              )
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


}
