import 'dart:convert';

class SchedueModel {
  final String day;
  SchedueModel({ required this.day, required this.timeSlots});
  final List<String> timeSlots;

  SchedueModel copyWith({
    dynamic id,
    String? day,
  }) {
    return SchedueModel(
        day: day ?? this.day, timeSlots: timeSlots);
  }

  Map<String, dynamic> toMap() {
    return {
    
      'day': day,
    };
  }

  factory SchedueModel.fromMap(Map<String, dynamic> map) {
    return SchedueModel(
         day: map['day'] ?? '', timeSlots: map["slots"] ?? []);
  }

  String toJson() => json.encode(toMap());

  factory SchedueModel.fromJson(String source) =>
      SchedueModel.fromMap(json.decode(source));

  @override
  String toString() => 'SchedueModel( day: $day)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SchedueModel && other.day == day;
  }

  @override
  int get hashCode => day.hashCode;
}
