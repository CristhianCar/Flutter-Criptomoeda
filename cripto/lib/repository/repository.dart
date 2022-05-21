import 'dart:convert';

import 'package:cripto/config/const/const.dart';
import 'package:flutter/services.dart';

import '../entity/coins_entity.dart';
import '../entity/user_entity.dart';

abstract class Repository {
  Future<UserEntity?> getUserData();
  Future<List<CoinsEntity>?> getCoinsData();
  Future<CoinDetails?> getCoinsDetailsData();
}


class ImpRepository implements Repository {

  @override
  Future<List<CoinsEntity>?> getCoinsData() async {
    try {
      
    final response = await rootBundle.loadString(Const.DATA_PATH);
    final jsonResponse = json.decode(response);
    
    await Future.delayed(const Duration(seconds: 2));
    return List<CoinsEntity>.from(jsonResponse['data'].map((x) => CoinsEntity.fromMap(x)).toList());

    } catch (err) {
      return null;
    }
  }

  @override
  Future<CoinDetails?> getCoinsDetailsData() {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> getUserData() async {
     try {
      
    final response = await rootBundle.loadString(Const.DATA_PATH);
    final jsonResponse = json.decode(response);
    
    await Future.delayed(const Duration(seconds: 2));
    return UserEntity.fromMap(jsonResponse);

    } catch (err) {
      return null;
    }
  }
  
}