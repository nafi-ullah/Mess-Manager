import 'dart:convert';

class MealModel{
  final String id;
  final String name;
  final String messid;
  final String mealMenu;
  final int count;
  final String comment;

  MealModel({
    required this.id,
    required this.name,
    required this.messid,
    required this.mealMenu,
    required this.count,
    required this.comment});

// json serialization (parameter gula select kore bulb icon a click korar por option ashbe)
  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'messid': messid,
      'mealMenu': mealMenu,
      'count': count,
      'comment': comment
    };
  }
  factory MealModel.fromMap(Map<String,dynamic>map){
    return MealModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      messid: map['messid'] ?? '',
      mealMenu: map['mealMenu'] ?? '',
      count: map['count'] ?? '',
      comment: map['comment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) => MealModel.fromMap(json.decode(source));


}