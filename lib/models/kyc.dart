import 'dart:convert';



class Kyc {
  final String  name;
  final String  dateofbirth;
  final String  image;
  final String  userId;
  final String  profilepic;
  final String residence;
  final String type;
  final String number;
  Kyc( {
    required this.name,
    required this.dateofbirth,
    required this.profilepic,
    required this.userId,
    required this.image,
    required this.residence,
    required this.type,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return {
      'name':name,
      'dateofbirth':dateofbirth,
      'profilepic':profilepic,
      'userId':userId,
      'image':image,
      'residence':residence,
      'type':type,
      'number':number
    };
  }

  factory Kyc.fromMap(Map<String, dynamic> map) {
    return Kyc(
        dateofbirth: map['dateofbirth'] ?? '',
        profilepic: map['profilepic'] ?? '',
        userId: map['userId'] ?? '',
        image: map['image'] ?? '',
        residence: map['residence'] ?? '',
        type: map["type"] ?? '',
        number: map["number"] ?? '',
        name: map["name"] ?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory Kyc.fromJson(String source) => Kyc.fromMap(json.decode(source));

  Kyc copyWith({
    String? dateofbirth,
    String? profilepic,
    String? userId,
    String? image,
    String? residence,
    String? type,
    String? number,
    String? name,
  }) {
    return Kyc(
         dateofbirth:  dateofbirth ?? this. dateofbirth,
        profilepic:  profilepic ?? this. profilepic,
        userId:  userId ?? this. userId,
        image:  image ?? this. image,
        residence: residence ?? this.residence,
        type: type ?? this.type,
        number: number ?? this.number,
        name: name ?? this.name

    );
  }

}
