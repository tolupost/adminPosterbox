import 'dart:convert';



class Cards {
  final String cardholdername;
  final String expiry;
  final String cardnumber;
  final String cvv;
  Cards( {
    required this.cardholdername,
    required this.expiry,
    required this.cardnumber,
    required this.cvv,
  });

  Map<String, dynamic> toMap() {
    return {
      'cardholdername': cardholdername,
      'expiry': expiry,
      'cardnumber':cardnumber,
      'cvv':cvv
    };
  }


  factory Cards.fromMap(Map<String, dynamic> map) {
    final List<dynamic> values = map['card'] ?? [];
    return Cards(
        cardholdername: values[0] ?? '',
        expiry: values[1] ?? '',
        cardnumber: values[2] ?? '',
        cvv: values[3] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cards.fromJson(String source) => Cards.fromMap(json.decode(source));

  Cards copyWith({
    String? cardholdername,
    String? expiry,
    String? cardnumber,
    String? cvv,
  }) {
    return Cards(
        cardholdername: cardholdername ?? this.cardholdername,
        expiry: expiry ?? this.expiry,
        cardnumber: cardnumber ?? this.cardnumber,
        cvv: cvv ?? this.cvv

    );
  }

}