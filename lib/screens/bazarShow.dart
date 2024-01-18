import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/models/bazarModel.dart';
import 'package:mess_app/services/bazar_service.dart';
import 'package:mess_app/widgets/bazarData.dart';
import 'package:mess_app/widgets/bazarForm.dart';

class BazarShow extends StatefulWidget {
  const BazarShow({super.key});

  @override
  State<BazarShow> createState() => _BazarShowState();
}

class _BazarShowState extends State<BazarShow> {
  List<BazarModel> bazarList = [];
  final BazarService bazarService = BazarService();


  fetchAllBazar() async{
    bazarList = await bazarService.fetchAllBazar(context);
    setState(() {

    });
  }

  void _openAddExpenseOverlay() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BazarForm(),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllBazar();
  }


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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [

            BazarData()

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _openAddExpenseOverlay,
          elevation: 0.0,
          label: const Text("Add"),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add_shopping_cart_sharp),
          backgroundColor: kPrimaryColor,
      ),
    );
  }
}
