import 'package:hive/hive.dart';
import 'package:get/get.dart';

class ListChangeProvider extends GetxController {
  var list = <String>[].obs;
  late Box lisbox;
  @override
  void onInit() async {
    super.onInit();
    lisbox = await Hive.openBox("ListBox");
    list.addAll(lisbox.get('list', defaultValue: []));
  }

  void addItem(String item) {
    if (list.contains(item)) {
      Get.snackbar("Error", "Item already exists");
      return;
    }
    if (item.isEmpty) {
      Get.snackbar("Error", "Item cannot be empty");
      return;
    }
    list.add(item);
    lisbox.put('list', list);
  }

  void removeItem(String item) {
    if (!list.contains(item)) {
      Get.snackbar("Error", "Item not found");
      return;
    }
    if (item.isEmpty) {
      Get.snackbar("Error", "Item cannot be empty");
      return;
    }
    list.remove(item);
    lisbox.put('list', list);
  }

  void clearList() {
    list.clear();
    lisbox.put('list', list);
  }
}
