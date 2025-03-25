import 'package:flutter/material.dart';
import 'package:to_do_list/changeprov.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ListChangeProvider listChangeProvider = Get.put(ListChangeProvider());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController textController =
                      TextEditingController();
                  return AlertDialog(
                    title: Text("Add Item"),
                    content: TextField(
                      controller: textController,
                      decoration: InputDecoration(hintText: "Enter item"),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          listChangeProvider.addItem(textController.text);
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: listChangeProvider.list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listChangeProvider.list[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  listChangeProvider.removeItem(listChangeProvider.list[index]);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
