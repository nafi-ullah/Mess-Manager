import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatCommunication extends StatefulWidget {
  const ChatCommunication({super.key});

  @override
  State<ChatCommunication> createState() => _ChatCommunicationState();
}

class _ChatCommunicationState extends State<ChatCommunication> {
  TextEditingController msgInputController = TextEditingController();
  late IO.Socket socket;

  void sendMessage(String msg){

  }
  @override
  void initState() {
    // TODO: implement initState
    socket = IO.io('${uri}',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()  // disable auto-connection
            .build()
    );
    socket.connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                return MessageItem(sentByMe: true);
              }),
            ), flex:9),
            Expanded(child: Container(
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
                  suffixIcon: Container(

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
                        size: 15,
                      ),
                    ),
                  )
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({super.key,
  required this.sentByMe
  });

  final bool sentByMe;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello"),
    );
  }
}

