import 'package:cripto/config/const/colors.dart';
import 'package:cripto/config/fonts/app_fonts.dart';
import 'package:cripto/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ProfilePage extends GetView<Controller> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
      child: Column(children: [
        const Text('Minha carteira:').body(Colors.white),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('${controller.state?.wallet_id}').title(Colors.white),
        ),
        Container(
          height: 0.5,
          margin: const EdgeInsets.symmetric(vertical: 24),
          width: double.maxFinite,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        _options()
      ]),
    );
  }

  Widget _options() {
    return ListView(
      shrinkWrap: true,
      children: [
        _item('Histórico', Icons.history),
        _item('Configurações', Icons.settings),
        _item('Sair', Icons.logout_outlined),
      ],
    );
  }

  Widget _item(String title, IconData icon, [Color? color]){
    return ListTile(
          leading: Icon(icon, color: Colors.white,),
          title: Text(title).subtitle(color ?? Colors.white),
        );
  }
}
