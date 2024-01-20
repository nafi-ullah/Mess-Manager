import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/models/chatController/chatController.dart';
import 'package:mess_app/models/chatController/message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
    super.initState();
  }

  void setUpSocketListener() {
      socket.on('message-recieve',(data){
        print("Hey got message: ${data}");
        chatController.chatMessages.add(Message.fromJson(data));
      });

      
  }
  void sendMessage(String msg){
    print(msg);
    var messageJson= {
      "message": msg,
      "sentByMe": socket.id
    };
    chatController.chatMessages.add(Message.fromJson(messageJson));
    socket.emit('message', messageJson);
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
            Expanded(flex:9, child: Container(
              child: Obx(
            ()=> ListView.builder(
                    itemCount: chatController.chatMessages.length,
                    itemBuilder: (context, index){
                      var currentItem = chatController.chatMessages[index];
                  return MessageItem(
                      sentByMe: currentItem.sentByMe == socket.id,
                      message:  currentItem.message,
                  );
                }),
              ),
            )),
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
  required this.sentByMe,
    required this.message
  });

  final bool sentByMe;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message),
    );
  }
}

