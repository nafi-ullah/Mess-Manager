import 'package:flutter/material.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;


  @override
  Widget build(BuildContext context) {
     int appId= 930163645;
     String appSign= "250753288ba4858f49cf6307ff1749d891bf194a8635837b177db69c531b8b79";
     final user = Provider.of<UserProvider>(context).user;

    return ZegoUIKitPrebuiltCall(
      appID: appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: user.id,
      userName: user.name,
      callID: user.messid,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
    );
  }
}

