import 'dart:convert';



class Schedule {
  final String  to;
  final String  from;
  final String date;
  final String time;
  final String? id;
  Schedule( {
    required this.to,
    required this. from,
    required this.date,
    required this.time,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'to':to,
      ' from':  from,
      'date': date,
      'time':time,
      'id':id
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    final List<dynamic> values = map['schedule'] ?? [];
    return Schedule(

        from: values[0] ?? '',
        date: values[1] ?? '',
        time: values[2] ?? '',
        id: values[3] ?? '',
        to: values[4] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) => Schedule.fromMap(json.decode(source));

  Schedule copyWith({
    String?  from,
    String? date,
    String? time,
    String? id,
    String? to,
  }) {
    return Schedule(
        from:  from ?? this. from,
        date: date ?? this.date,
        time: time ?? this.time,
        id: id ?? this.id,
        to: to ?? this.to

    );
  }

}