import 'package:flutter/material.dart';
import 'package:mess_app/screens/communication/call_page.dart';


class Communication extends StatelessWidget {
  const Communication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              //
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CallPage(callID: 'u1u2'),
                ),
              );
              //
            },
            child: const Text('Start Call'),
          ),
        ),
      ),
    );
  }
}