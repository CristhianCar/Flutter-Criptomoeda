import 'package:cripto/config/const/colors.dart';
import 'package:cripto/config/fonts/app_fonts.dart';
import 'package:cripto/core/routes/pages.dart';
import 'package:cripto/view/coins/details/coins_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/coins_controller.dart';
import '../../../entity/coins_entity.dart';
import '../../../utils/formatter.dart';

class CoinsResume extends GetView<CoinsController> {
  const CoinsResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _data(state),
      onError: (err) => Text(err.toString() + "Errorr").body(Colors.white),
      onLoading: Shimmer.fromColors(
        child: _data(null), 
        baseColor: MyColors.primary400,
        highlightColor: MyColors.primary400.withOpacity(0.3),
        ));
  }

  Widget _data(List<CoinsEntity>? coins) {
    return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    physics: const BouncingScrollPhysics(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start, 
      children: [
        ...List.generate(
          _resumeLength(coins?.length),
          ((index) => _card(
            getColor(index),
            coin_name: coins?[index].currency_name,
            symbolImg: coins?[index].image_url,
            amount: coins?[index].cotation,
            coin: coins?[index]
          ))
        ),
      _more()
    ]),
  );
  }

  Color getColor(int index) {
    List<Color> color = [
      MyColors.secondary,
      MyColors.terciary,
      MyColors.fourthy,
    ];
    return color[index];
  }

  int _resumeLength(int? coinsLength) {
    return (coinsLength ?? 3) > 3 ? 3 : (coinsLength ?? 3);
  }

  Widget _card(
    Color colors,
      {required String? coin_name,
      required String? symbolImg,
      required String? amount,
      required CoinsEntity? coin,
      }) {
    return GestureDetector(
      onTap: () => Get.bottomSheet(CoinsDetailsPage(coin)),
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 130,
        constraints: const BoxConstraints(
          minWidth: 200,
          maxWidth: 400,
        ),
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: symbolImg != null ? Image.network(
                      symbolImg,
                      height: 48,
                      alignment: Alignment.centerLeft,
                    ) : const SizedBox(),
                  ),
                  Text(Formatter.money(amount)).title()
                ],
              ),
            ),
            Text(coin_name ?? '').body(),
          ],
        ),
      ),
    );
  }

  Widget _more() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.COINS),
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 130,
        width: 130,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.more_horiz,
              color: MyColors.primary,
              size: 64,
            ),
            const Text('Ver mais', textAlign: TextAlign.center).body(),
          ],
        ),
      ),
    );
  }
}
