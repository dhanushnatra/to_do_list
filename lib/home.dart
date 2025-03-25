import 'package:flutter/material.dart';
import 'package:to_do_list/changeprov.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ListChangeProvider listChangeProvider = Get.put(ListChangeProvider());
  final TextEditingController _controller = TextEditingController();

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
              Get.defaultDialog(
                title: "Add Item",
                content: Center(
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(hintText: "Enter item"),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          listChangeProvider.addItem(_controller.text);
                          _controller.clear();
                          Get.back();
                        },
                        child: Text("Add"),
                      ),
                    ],
                  ),
                ),
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
