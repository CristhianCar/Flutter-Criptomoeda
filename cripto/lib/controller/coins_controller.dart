import 'package:get/get.dart';

import '../entity/coins_entity.dart';
import '../service/service.dart';

class CoinsController extends GetxController with StateMixin<List<CoinsEntity>> { 

  final Service _service;

  CoinsController(this._service);

  @override
  void onInit() {
    loadCoins();
    super.onInit();
  }

  Future<void> loadCoins() async {
    await _service.loadCoins()
      .then((value) {
        change(_service.coins, status: RxStatus.success());
      })
      .catchError((err) {
        change(null, status: RxStatus.error());
      });
  }

}