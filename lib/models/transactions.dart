import 'dart:convert';



class Transaction {
  final String  username;
  final String  cost;
  final String type;
  final String userId;
  final int orderedAt;
  final String? id;
  Transaction( {
    required this.username,
    required this.cost,
    required this.type,
    required this.userId,
    required this.orderedAt,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'username':username,
      ' cost':  cost,
      'type': type,
      'userId':userId,
      'orderedAt':orderedAt,
      'id':id
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(

        cost: map['cost'] ?? '',
        type: map['type'] ?? '',
        userId: map["userId"] ?? '',
        orderedAt: map["createdAt"] ?? '',
        id: map["id"] ?? '',
        username: map["username"] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) => Transaction.fromMap(json.decode(source));

  Transaction copyWith({
    String?  cost,
    String? type,
    String? userId,
    int? orderedAt,
    String? id,
    String? username,
  }) {
    return Transaction(
        cost:  cost ?? this. cost,
        type: type ?? this.type,
        userId: userId ?? this.userId,
        orderedAt: orderedAt ?? this.orderedAt,
        id: id ?? this.id,
        username: username ?? this.username

    );
  }

}