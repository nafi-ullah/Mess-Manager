import 'dart:convert';

enum MealMenu {
  Off,
  Chicken,
  Fish,
  Rice
}
enum MealTime{
  Lunch,
  Dinner
}


class MembersMeal{
  const MembersMeal({
    required this.id,
    required this.name,
    required this.messid,
    required this.lunchMeal,
    required this.lunchCount,
    required this.dinnerMeal,
    required this.dinnerCount,
    required this.lunchComment,
    required this.dinnerComment,
    required this.date,

    // required this.totalChickenCount,
    // required this.totalFishCount,
    // required this.totalStarCount,
  });

  final String id;
  final String name;
  final String messid;
  final String lunchMeal;
  final int lunchCount;
  final String dinnerMeal;
  final int dinnerCount;
  final String lunchComment;
  final String dinnerComment;
  final String date;
  // final int totalChickenCount;
  // final int totalFishCount;
  // final int totalStarCount;
  factory MembersMeal.fromMap(Map<String,dynamic>map){
    return MembersMeal(
      id: map['_id'],
      name: map['name'],
      messid: map['messid'],
      lunchMeal: map['lunchMeal'],
      lunchCount: map['lunchCount'],
      dinnerMeal: map['dinnerMeal'],
      dinnerCount: map['dinnerCount'],
      lunchComment: map['lunchComment'],
      dinnerComment: map['dinnerComment'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'messid': messid,
      'lunchMeal': lunchMeal,
      'lunchCount': lunchCount,
      'dinnerMeal': dinnerMeal,
      'dinnerCount': dinnerCount,
      'lunchComment': lunchComment,
      'dinnerComment': dinnerComment,
      'date': date,
    };
  }
  String toJson() => json.encode(toMap());

  factory MembersMeal.fromJson(String source) => MembersMeal.fromMap(json.decode(source));

}