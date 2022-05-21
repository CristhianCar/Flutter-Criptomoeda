import 'package:cripto/view/coins/coins_page.dart';
import 'package:cripto/view/home/home_page.dart';
import 'package:get/route_manager.dart';

import '../../binding/binding.dart';

part 'routes.dart';

class Pages {
  static List<GetPage> get getPages => [
        GetPage(
            name: _Routes.START,
            page: () => const HomePage(),
            binding: HomeBinding(),
            children: [
              GetPage(
                name: _Routes.COINS,
                page: () => const CoinsPage(),
              )
            ])
      ];
}
