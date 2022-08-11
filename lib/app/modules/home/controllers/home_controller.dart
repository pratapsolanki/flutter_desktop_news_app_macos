import 'package:get/get.dart';
import 'package:news/app/data/utils/constants.dart';

class HomeController extends GetxController {
  final index = 0.obs;
  final title = Constants.pages[0].title.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateIndex(int pos) {
    index.value = pos;
  }

  void updateName(String name) {
    title.value = name;
  }
}
