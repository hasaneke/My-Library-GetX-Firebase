import 'dart:ui';

import 'package:get/get.dart';
import 'package:my_library/data/models/category/my_category.dart';

import 'package:my_library/data/repository/firebase_firestore/fetch_categories_from_firebase.dart';
import 'package:my_library/domain/usecases/mycard/fetch_mycards.dart';

class FetchCategories {
  static Future<Map<String, MyCategory>> fetchMainCategories(
      String path) async {
    var querySnapshot =
        await FetchCategoriesFromFirestoreApi.fetchCategoriesApi(path);
    Map<String, MyCategory> categories = {};
    for (var doc in querySnapshot!.docs) {
      var newMainCat = MyCategory(
          containerCategoryPath: '',
          path: doc.reference.path,
          title: RxString(doc.get('title')),
          color: Color(doc.get('color_code')));

      newMainCat.myCards =
          RxMap(await FetchMyCards.fetchMyCards(doc.reference.path));
      newMainCat.subCategories.value =
          await _fetchSubCategories(doc.reference.path);
      categories[doc.reference.path] = newMainCat;

      Get.put(newMainCat, tag: newMainCat.path);
    }
    return categories;
  }

  static Future<Map<String, MyCategory>> _fetchSubCategories(
      String path) async {
    var querySnapshot =
        await FetchCategoriesFromFirestoreApi.fetchCategoriesApi(
            path + '/categories');
    Map<String, MyCategory> subCategories = {};
    for (var doc in querySnapshot!.docs) {
      var newSubCat = MyCategory(
          containerCategoryPath: path,
          path: doc.reference.path,
          title: RxString(doc.get('title')),
          color: Color(doc.get('color_code')));

      newSubCat.myCards =
          RxMap(await FetchMyCards.fetchMyCards(newSubCat.path));
      newSubCat.subCategories.value = await _fetchSubCategories(newSubCat.path);
      subCategories[newSubCat.path] = newSubCat;

      Get.put(newSubCat, tag: newSubCat.path);
    }
    return subCategories;
  }
}
