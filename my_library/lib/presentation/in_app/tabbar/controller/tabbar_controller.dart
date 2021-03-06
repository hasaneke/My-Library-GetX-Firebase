import 'package:get/get.dart';

import 'package:my_library/data/repository/firebase_auth/signout_api.dart';

import 'package:my_library/presentation/in_app/tabbar/pages/tabs/all_cards_screen/pages/all_cards_screen.dart';

import 'package:my_library/presentation/in_app/tabbar/pages/tabs/home/home_screen.dart';

import 'package:my_library/presentation/in_app/tabbar/pages/tabs/marked_cards/marked_cards_screen.dart';

class TabbarController extends GetxController {
  RxBool isLoading = true.obs;
  RxInt tabIndex = RxInt(0);
  var pages = RxList([
    HomeScreen(),
    MarkedCardsScreen(),
    AllCardsScreen(),
  ]);
  signOut() {
    SignoutApi.signOut();
    Get.back();
  }

  changeTab(int selectedTabIndexValue) {
    tabIndex.value = selectedTabIndexValue;
  }
}
