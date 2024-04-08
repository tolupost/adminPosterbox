
import 'package:adminposterbox/models/schedule.dart';
import 'package:adminposterbox/pages/Deliveries/widgets/Category.dart';
import 'package:flutter/material.dart';

import '../models/card.dart';
import '../models/kyc.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    phone: '',
    token: '', card:[],
    kyc: [], wallet: 0,
    schedule:[],
    image: '', verified: '', ongoing: '',
    deliveriesDone: 0, orderedAt: 0,

  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}