import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';

class BazarShow extends StatefulWidget {
  const BazarShow({super.key});

  @override
  State<BazarShow> createState() => _BazarShowState();
}

class _BazarShowState extends State<BazarShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 40,
                  alignment: Alignment.topLeft,
                  child: const Text("Bazar Page", style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),)
              ),

            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Text("History"),

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          elevation: 0.0,
          label: const Text("Add"),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add_shopping_cart_sharp),
          backgroundColor: kPrimaryColor,
      ),
    );
  }
}
