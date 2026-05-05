import 'package:get/get.dart';
import 'package:theory_project/controllers/theory_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TheoryController(), permanent: true);
  }
}
