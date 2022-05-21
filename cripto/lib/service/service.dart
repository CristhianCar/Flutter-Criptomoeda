import 'package:cripto/entity/coins_entity.dart';
import 'package:get/get.dart';

import 'package:cripto/repository/repository.dart';

import '../entity/user_entity.dart';

abstract class Service {
    Future<void> loadUserInfo();
    UserEntity? get user;

    Future<void> loadCoins();
    List<CoinsEntity> get coins;

    Future<CoinDetails> loadDetails(String name);
}


class ImpService extends GetxService implements Service {

  final Repository _repository;

  ImpService(this._repository);

  final Rxn<UserEntity> _user = Rxn<UserEntity>();
  final _coins = <CoinsEntity>[].obs;
  

  @override
  Future<void> loadUserInfo() async {

    _user.value = await _repository.getUserData()
      .catchError((err) => {});
  }

  @override
  UserEntity? get user => _user.value;

  @override
  Future<void> loadCoins() async {
    _coins.value = await _repository.getCoinsData()
      .catchError((err) => {}) ?? [];
  }

  @override
  List<CoinsEntity> get coins => _coins.value;

  @override
  Future<CoinDetails> loadDetails(String name) async {
      await Future.delayed(const Duration(seconds: 2));
      return Future.value(_coins.firstWhereOrNull((element) => element.currency_name == name)?.details);
  }
  
}
