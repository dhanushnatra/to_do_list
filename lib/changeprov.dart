import 'package:get/get.dart';

class ListChangeProvider extends GetxController {
  var list = <String>[].obs;

  void addItem(String item) {
    list.add(item);
  }

  void removeItem(String item) {
    list.remove(item);
  }

  void clearList() {
    list.clear();
  }
}