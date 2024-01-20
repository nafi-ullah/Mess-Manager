

class Message {
  String message;
  String sentByMe;
  String time;
  String name;
  String messid;
  Message({
    required this.message,
    required this.sentByMe,
    required this.time,
    required this.name,
    required this.messid
});
  factory Message.fromJson(Map<String, dynamic> json){
     return Message(message: json["message"],
       sentByMe: json["sentByMe"],
        time: json["time"],
        name: json["name"],
        messid: json["messid"]
     );
  }


}