import 'package:cripto/config/const/colors.dart';
import 'package:cripto/controller/controller.dart';
import 'package:cripto/config/fonts/app_fonts.dart';
import 'package:cripto/entity/user_entity.dart';
import 'package:cripto/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../profile/profile_page.dart';
import 'components/coins_resume.dart';

class HomePage extends GetView<Controller> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Get.bottomSheet(const ProfilePage()),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                    color: MyColors.secondary, shape: BoxShape.circle),
                child: const Icon(Icons.people, color: MyColors.primary),
              ),
              const Text('Meu perfil').caption(Colors.white)
            ],
          ),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _balance(),
        // Obx(() => Text('${controller.walletId}').title(Colors.white)),
        const CoinsResume(),
        _myWallet()
      ],
    );
  }

  Widget _myWallet() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.primary400,
        borderRadius: BorderRadius.circular(32)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Minhas moedas').title(Colors.white),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Center(child: const Text('Você não possui nenhuma moeda').caption(Colors.white)),
          )
        ]
      ),
    );
  }

  Widget _balance() {
    return controller.obx(
      (state) => _balanceData(state),
      onLoading: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Shimmer.fromColors(
          baseColor: MyColors.primary400,
          highlightColor: MyColors.primary400.withOpacity(0.3),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
          )),
      )
    );
  }

  Widget _balanceData(UserEntity? state) {
    return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Seu saldo').caption(Colors.white),
              const SizedBox(height: 8),
              Text(Formatter.money(state?.user_balance))
                  .title(Colors.white),
            ],
          ));
  }
}
