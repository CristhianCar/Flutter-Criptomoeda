import 'package:cripto/config/fonts/app_fonts.dart';
import 'package:cripto/controller/coins_controller.dart';
import 'package:cripto/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../entity/coins_entity.dart';
import 'details/coins_details_page.dart';

class CoinsPage extends GetView<CoinsController> {

  const CoinsPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
             centerTitle: true,
             title: const Text('Todas as moedas'),),
           body: ListView(
              children: List.generate(
                controller.state?.length ?? 0, 
                (index) => _listTile(controller.state![index]))
           ),
       );
  }

  Widget _listTile(CoinsEntity coin) {
    return ListTile(
      onTap: () => Get.bottomSheet(CoinsDetailsPage(coin)),
      leading: Image.network(coin.image_url, height: 32),
      title: Text(coin.currency_name).body(Colors.white),
      trailing: Text("1 ${coin.symbol} = " + Formatter.money(coin.cotation)).body(Colors.white),
    );
  }
}