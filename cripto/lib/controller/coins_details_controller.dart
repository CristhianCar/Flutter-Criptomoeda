import 'package:cripto/entity/coins_entity.dart';
import 'package:cripto/service/service.dart';
import 'package:get/get.dart';

class CoinsDetailsController extends GetxController with StateMixin<CoinDetails> { 

  final Service _service;
  final String name;

  CoinsDetailsController(this._service, this.name);

  @override
  void onInit() {
    loadDetails();
    super.onInit();
  }

  Future<void> loadDetails() {
    return _service.loadDetails(name)
      .then((value) {
        change(value, status: RxStatus.success());
      })
      .catchError((err) {
        change(null, status: RxStatus.error());
      });
  }
}