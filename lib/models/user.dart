import 'dart:convert';

import 'package:adminposterbox/models/card.dart';
import 'package:adminposterbox/models/schedule.dart';



class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String phone;
  final String token;
  final String image;
  final String verified;
  final String ongoing;
  final int orderedAt;
  final int wallet;
  final int deliveriesDone;
  final List<dynamic>? card;
  final List<dynamic> kyc;
  final List<dynamic>? schedule;



  User( {
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.phone,
    required this.verified,
    required this.ongoing,
    required this.orderedAt,
    required this.token,
    required this.card,
    required this.kyc,
    required this.wallet,
    required this.deliveriesDone,
    required this.image,
    required this.schedule,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      'verified': verified,
      'ongoing': ongoing,
      'orderedAt': orderedAt,
      'deliveriesDone': deliveriesDone,
      'wallet': wallet,
      'token': token,
      'card': card, // convert the card object to a map
      'image':image,
      'kyc': kyc, // convert the kyc object to a map
      'schedule': schedule,

    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      token: map['token'] ?? '',
      image: map['image'] ?? '',
      verified: map['verified'] ?? '',
      ongoing: map['ongoing'] ?? '',
      orderedAt: map['orderedAt'] ?? 0,
      wallet: map['wallet'] ?? 0,
      deliveriesDone: map['deliveriesDone'] ?? 0,
      card: List<Map<String, dynamic>>.from(
        map['card'].map(
              (x) => Map<String, dynamic>.from(x),
        ),
      ),
      kyc: List<Map<String, dynamic>>.from(
        map['kyc']?.map(
              (x) => Map<String, dynamic>.from(x),
        ),
      ),
      schedule: List<Map<String, dynamic>>.from(
        map['schedule'].map(
              (x) => Map<String, dynamic>.from(x),
        ),
      ),




    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? phone,
    String? image,
    String? verified,
    String? ongoing,
    int? orderedAt,
    int? wallet,
    int? deliveriesDone,
    String? token,
    List<dynamic>? card,
    List<dynamic>? kyc,
    List<dynamic>? schedule,

  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      token: token ?? this.token,
      card: card ?? this.card,
      verified: verified ?? this.verified,
      ongoing: ongoing ?? this.ongoing,
      orderedAt: orderedAt ?? this.orderedAt,
      image: image ?? this.image,
      kyc: kyc ?? this.kyc,
      wallet: wallet ?? this.wallet,
      schedule: schedule ?? this.schedule,

      deliveriesDone: deliveriesDone ?? this.deliveriesDone,
    );
  }
}








