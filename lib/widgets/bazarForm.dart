import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mess_app/services/bazar_service.dart';
import 'package:intl/intl.dart';

class BazarForm extends StatefulWidget {
  const BazarForm({super.key});

  @override
  State<BazarForm> createState() => _BazarFormState();
}

class _BazarFormState extends State<BazarForm> {
  List<TextEditingController> listController = [TextEditingController()];
  List<TextEditingController> quantityController = [TextEditingController()];
  List<TextEditingController> costController = [TextEditingController()];
  final BazarService bazarService = BazarService();

  void SaveData(){

    //show here listController values
    List<String> bazar = List<String>
        .from(listController.map((controller) => controller.text));

    List<String> quantity = List<String>
        .from(quantityController.map((controller) => controller.text));

    List<int> cost = List<int>.from(costController.map((controller) {
      String text = controller.text;
      // Use int.tryParse to convert text to an integer, handle potential errors
      return int.tryParse(text) ; // Default to 0 if conversion fails
    }));
    print(bazar);
    print(quantity);
    print(cost);

    bazarService.pushBazar(
        context: context,
        bazar: bazar,
        quantity: quantity,
        cost: cost
    );

    // for (int i = 0; i < listController.length; i++) {
    //   print('Item ${i + 1} Name: ${listController[i].text}');
    //   String test= listController[i].text;
    //   if (test == ""){
    //     print("Yess");
    //   }
    //   print('Item ${i + 1} Quantity: ${quantityController[i].text}');
    //   print('Item ${i + 1} Cost: ${costController[i].text}');
    //   print('------------------------');
    // }

  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Format the date as "dd-Month Name-yyyy"
    String formattedDate = DateFormat('dd-MMMM-yyyy').format(now);


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
                  child: const Text("Add to Cart", style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),)
              ),

            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Row(
              children: [
                Text(
                  "Date: ",
                ),
                Text(formattedDate),
                Spacer(),
                ElevatedButton(onPressed: SaveData, child: Text("Save"))
              ],
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              itemCount: listController.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey<TextEditingController>(listController[index] ),
                  onDismissed: (DismissDirection direction){
                    setState(() {
                      listController[index].clear();
                      listController[index].dispose();
                      listController.removeAt(index);

                      quantityController[index].clear();
                      quantityController[index].dispose();
                      quantityController.removeAt(index);

                      costController[index].clear();
                      costController[index].dispose();
                      costController.removeAt(index);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2E384E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Item Name TextField with a size ratio of 5
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: TextField(
                                      controller: listController[index],
                                      decoration: InputDecoration(labelText: 'Item Name'),
                                    ),
                                  ),
                                ),

                                // Quantity TextField with a size ratio of 2
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: TextField(
                                      controller: quantityController[index],
                                      decoration: InputDecoration(labelText: 'Qt'),
                                    ),
                                  ),
                                ),
                                // Cost TextField with a size ratio of 3
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextField(
                                      controller: costController[index],
                                      decoration: InputDecoration(labelText: 'Price'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // child: TextFormField(
                            //   controller: listController[index],
                            //   autofocus: false,
                            //   style: const TextStyle(color: Color(0xFFF8F8FF)),
                            //   decoration: const InputDecoration(
                            //     border: InputBorder.none,
                            //     hintText: "Item name",
                            //     hintStyle: TextStyle(
                            //         color: Color.fromARGB(255, 132, 140, 155)),
                            //   ),
                            // ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // index != 0
                        //     ? GestureDetector(
                        //   onTap: (){
                        //     setState(() {
                        //       listController[index].clear();
                        //       listController[index].dispose();
                        //       listController.removeAt(index);
                        //     });
                        //   },
                        //   child: const Icon(
                        //     Icons.delete,
                        //     color: Color(0xFF6B74D6),
                        //     size: 20,
                        //   ),
                        // )
                        //     : const SizedBox()
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                listController.add(TextEditingController());
                quantityController.add(TextEditingController());
                costController.add(TextEditingController());
              });
            },
            child: Center(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: const Color(0xFF444C60),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Add More",

                  )
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          )
        ],
      ),
    );
  }
}
