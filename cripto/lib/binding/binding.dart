import 'package:cripto/repository/repository.dart';
import 'package:get/get.dart';

import '../controller/coins_controller.dart';
import '../controller/controller.dart';
import '../service/service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final Repository repository = ImpRepository();
    Get.lazyPut<Service>(() => ImpService(repository));
    Get.lazyPut<Controller>(() => Controller(Get.find()));
    Get.lazyPut<CoinsController>(() => CoinsController(Get.find()));
  }
}