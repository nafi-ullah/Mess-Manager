import 'dart:convert';

class User{
  final String id;
  final String name;
  final String email;
  final String password;
  final String messid;
  final String messname;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.messid,
    required this.messname,
    required this.token});

// json serialization (parameter gula select kore bulb icon a click korar por option ashbe)
  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'messid': messid,
      'messname': messname,
      'token': token
    };
  }
  factory User.fromMap(Map<String,dynamic>map){
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      messid: map['messid'] ?? '',
      messname: map['messname'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));


}