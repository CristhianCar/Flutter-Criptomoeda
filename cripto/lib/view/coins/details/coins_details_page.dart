import 'package:cripto/config/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/const/colors.dart';
import '../../../controller/coins_details_controller.dart';
import '../../../entity/coins_entity.dart';
import '../../../utils/formatter.dart';

class CoinsDetailsPage extends StatelessWidget {
  final CoinsEntity? coin;
  const CoinsDetailsPage(this.coin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight: Get.height / 2,
        ),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        child: GetBuilder<CoinsDetailsController>(
            init: CoinsDetailsController(Get.find(), coin!.currency_name),
            builder: (controller) {
              return controller.obx((state) => _body(state!));
            }),
      ),
    );
  }

  Widget _body(CoinDetails details) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(coin!.image_url, height: 64),
              const SizedBox(width: 24),
              Text(coin!.currency_name).title(Colors.white),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Text(details.about).body(Colors.white),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Preço').body(Colors.white),
          trailing:
              Text("1 ${coin!.symbol} = " + Formatter.money(coin!.cotation))
                  .subtitle(Colors.white),
        ),
        _spacer,
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Taxa').body(Colors.white),
          trailing: Text(Formatter.money(details.fee)).subtitle(Colors.red),
        ),
        _spacer,
        _button()
      ],
    );
  }

  Widget _button() {
    return Container(
      padding: const EdgeInsets.only(top: 32, bottom: 16),
      child: TextButton(
        onPressed: () {}, 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(MyColors.secondary),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
          ),
        child: Container(
          height: 40,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.card_travel, color: MyColors.primary,),
              const Text('Comprar').subtitle(),
              Container()
            ],
          ))),
    );
  }

  Widget get _spacer {
    return Container(
      height: 0.3,
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: double.maxFinite,
      color: Colors.white,
    );
  }
}
