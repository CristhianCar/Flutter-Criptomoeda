import 'package:cripto/entity/user_entity.dart';
import 'package:get/get.dart';

import 'package:cripto/repository/repository.dart';

import '../service/service.dart';

class Controller extends GetxController with StateMixin<UserEntity> {

  final Service _service;

  Controller(this._service);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    return _service.loadUserInfo()
      .then((value) {
        change(_service.user, status: RxStatus.success());
      })
      .catchError((err) {
        change(null, status: RxStatus.error());
      });
  }

}
