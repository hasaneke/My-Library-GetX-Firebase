import 'package:get/get.dart';
import 'package:my_library/presentation/in_app/add_card/controllers/add_card_controller.dart';
import 'package:my_library/presentation/in_app/card_detail/controller/card_detail_controller.dart';
import 'package:my_library/presentation/in_app/components/add_category_dialog/controller/add_category_dialog_controller.dart';
import 'package:my_library/presentation/in_app/tabbar/controller/tabbar_controller.dart';
import 'package:my_library/presentation/in_app/tabbar/pages/tabs/all_cards_screen/controller/all_cards_controller.dart';
import 'package:my_library/presentation/in_app/tabbar/pages/tabs/home/controller/home_controller.dart';
import 'package:my_library/presentation/in_app/tabbar/pages/tabs/marked_cards/controllers/marked_cards_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarController>(() => TabbarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AllCardsController>(() => AllCardsController());
    Get.lazyPut<MarkedCardsController>(() => MarkedCardsController());
    Get.lazyPut<AddCategoryDialogController>(
        () => AddCategoryDialogController(),
        fenix: true);
    Get.lazyPut<AddCardController>(() => AddCardController());
    Get.lazyPut<CardDetailController>(() => CardDetailController());
  }
}