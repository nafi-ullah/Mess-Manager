import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/models/chatController/chatController.dart';
import 'package:mess_app/models/chatController/message.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:intl/intl.dart';

class ChatCommunication extends StatefulWidget {
  const ChatCommunication({super.key});

  @override
  State<ChatCommunication> createState() => _ChatCommunicationState();
}

class _ChatCommunicationState extends State<ChatCommunication> {
  TextEditingController msgInputController = TextEditingController();
  late IO.Socket socket;
  ChatController chatController = ChatController();

  @override
  void initState() {
    // TODO: implement initState
    socket = IO.io('${uri}',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()  // disable auto-connection
            .build()
    );
    setUpSocketListener();
    socket.connect();
    joinedChat();
    super.initState();
  }

  void setUpSocketListener() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
      socket.on('message-recieve',(data){
        print("Hey got message: ${data}");

        Message getMsg = Message.fromJson(data);
        print(getMsg.messid);
        if(getMsg.messid == user.messid) {
          chatController.chatMessages.add(Message.fromJson(data));
        }
      });
  }
  void joinedChat(){
    final user = Provider.of<UserProvider>(context, listen: false).user;

     var roomData = {
        "name": user.name,
        "messid": user.messid
     };
     socket.emit('join_room', roomData);
  }

  void sendMessage(String msg){
   // print(msg);
    final user = Provider.of<UserProvider>(context, listen: false).user;
    var messageJson= {
      "name": user.name,
      "messid": user.messid,
      "message": msg,
      "sentByMe": socket.id,
      "time": _getCurrentTime()
    };
    chatController.chatMessages.add(Message.fromJson(messageJson));
    socket.emit('message', messageJson);
  }

  String _getCurrentTime() {
    var now = DateTime.now();
    var formattedTime = DateFormat.jm().format(now); // AM/PM format
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;


    return Scaffold(
      appBar: AppBar(
        title: Text("Addakhana"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(flex:9, child: Container(
              child: Obx(
            ()=> ListView.builder(
                    itemCount: chatController.chatMessages.length,
                    itemBuilder: (context, index){
                      var currentItem = chatController.chatMessages[index];
                  return MessageItem(
                      name: user.name,
                      sentByMe: currentItem.name == user.name,
                      message:  currentItem.message,
                      time: currentItem.time
                  );
                }),
              ),
            )),
            Row(
              children: [
                Expanded(
                    flex: 7,
                    child: Container(
                  padding: EdgeInsets.all(10),

                  child: TextField(
                    cursorColor: Colors.green,
                    controller: msgInputController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      // focusedBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.blue),
                      //     borderRadius: BorderRadius.circular(10)
                      // ),

                    ),
                  ),
                )),
                Container(

                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: IconButton(
                    onPressed: (){
                      sendMessage(msgInputController.text);
                      msgInputController.text = "";
                    },
                    icon: Icon(Icons.send,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



class MessageItem extends StatelessWidget {
  const MessageItem({super.key,
    required this.name,
  required this.sentByMe,
    required this.message,
    required this.time
  });

  final String name;
  final bool sentByMe;
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sentByMe? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          color: sentByMe ? Colors.black : Colors.purple,
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${name} :", style: TextStyle(
                  fontWeight: FontWeight.bold,

                ),),
                Text(message, style: TextStyle(
                  fontSize: 16
                ),),
              ],
            ),
            SizedBox(width: 8,),
            Text(time, style: TextStyle(
              color: Colors.white70,
              fontSize: 10
            ),),
          ],
        ),
      ),
    );
  }
}

