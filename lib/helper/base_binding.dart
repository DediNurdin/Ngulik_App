import 'package:get/get.dart';

import '../view_model/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(
      () => BaseController(),
    );
  }
}
