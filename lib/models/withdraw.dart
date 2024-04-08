import 'dart:convert';



class Withdraw {
  final String  username;
  final String  paid;
  final String account;
  final String name;
  final String userId;
  final int amount;
  final String? id;
  Withdraw( {
    required this.username,
    required this. paid,
    required this.account,
    required this.name,
    required this.userId,
    required this.amount,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'username':username,
      ' paid':  paid,
      'account': account,
      'userId':userId,
      'name':name,
      'amount':amount,
      'id':id
    };
  }

  factory Withdraw.fromMap(Map<String, dynamic> map) {
    return Withdraw(

        paid: map['paid'] ?? '',
        account: map['account'] ?? '',
        name: map["name"] ?? '',
        userId: map["userId"] ?? '',
        amount: map["amount"] ?? '',
        id: map["_id"] ?? '',
        username: map["username"] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory Withdraw.fromJson(String source) => Withdraw.fromMap(json.decode(source));

  Withdraw copyWith({
    String?  paid,
    String? account,
    String? name,
    String? userId,
    int? amount,
    String? id,
    String? username,
  }) {
    return Withdraw(
        paid:  paid ?? this. paid,
        account: account?? this.account,
        name: name ?? this.name,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        id: id ?? this.id,
        username: username ?? this.username

    );
  }

}