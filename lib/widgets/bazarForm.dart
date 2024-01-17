import 'package:flutter/material.dart';

class BazarForm extends StatefulWidget {
  const BazarForm({super.key});

  @override
  State<BazarForm> createState() => _BazarFormState();
}

class _BazarFormState extends State<BazarForm> {
  List<TextEditingController> listController = [TextEditingController()];

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
            child: Text(
              "Date: ",
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
                return Padding(
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
                          child: TextFormField(
                            controller: listController[index],
                            autofocus: false,
                            style: const TextStyle(color: Color(0xFFF8F8FF)),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Input Text Here",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 132, 140, 155)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      index != 0
                          ? GestureDetector(
                        onTap: (){
                          setState(() {
                            listController[index].clear();
                            listController[index].dispose();
                            listController.removeAt(index);
                          });
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Color(0xFF6B74D6),
                          size: 35,
                        ),
                      )
                          : const SizedBox()
                    ],
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
            width: 10,
          )
        ],
      ),
    );
  }
}
