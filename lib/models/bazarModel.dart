import 'dart:convert';

class BazarModel{
  final String name;
  final String messid;
  final String date;
  final List<String> bazar;
  final List<String> quantity;
  final List<int> cost;

  BazarModel({
    required this.name,
    required this.messid,
    required this.date,
    required this.bazar,
    required this.quantity,
    required this.cost,
  });
  @override
  String toString() {
    return '{name: $name, messid: $messid, date: $date, bazar: $bazar, quantity: $quantity, cost: $cost}';
  }

// json serialization (parameter gula select kore bulb icon a click korar por option ashbe)
  Map<String,dynamic> toMap(){
    return{
      'name': name,
      'messid': messid,
      'date': date,
      'bazar': bazar,
      'quantity': quantity,
      'cost': cost
    };
  }
  factory BazarModel.fromMap(Map<String,dynamic>map){
    return BazarModel(
      name: map['name'] ?? '',
      messid: map['messid'] ?? '',
      date: map['date'] ?? '',
      bazar: map['bazar'] ?? '',
      quantity: map['quantity'] ?? '',
      cost: map['cost'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BazarModel.fromJson(Map<String, dynamic> json) {
    return BazarModel(
      name: json['name'],
      messid: json['messid'],
      date: json['date'],
      bazar: List<String>.from(json['bazar']),
      quantity: List<String>.from(json['quantity']),
      cost: List<int>.from(json['cost']),
    );
  }


  //factory BazarModel.fromJson(String source) => BazarModel.fromMap(json.decode(source));


}