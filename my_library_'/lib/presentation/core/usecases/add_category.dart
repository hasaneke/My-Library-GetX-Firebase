import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_library/data/models/category/my_category.dart';
import 'package:my_library/data/repository/firestore/add_category_to_firebase.dart';
import 'package:my_library/presentation/core/data/datastore_controller.dart';

class AddCategory {
  static Future<void> addMainCategory(
      {required MyCategory mainCategory}) async {
    try {
      AddCategoryToFirebase.addCategoryToFirebase(myCategory: mainCategory);
      DatastoreController datastoreController = Get.find();
      datastoreController.addMainCategory(mainCategory);
      MyCategory myCategory =
          Get.put(mainCategory, tag: mainCategory.path, permanent: true);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> addSubCategory({required MyCategory subCategory}) async {
    try {
      AddCategoryToFirebase.addCategoryToFirebase(myCategory: subCategory);
      MyCategory containerCategory =
          Get.find(tag: subCategory.containerCategoryPath);
      containerCategory.addSubCategory(subCategory);
      MyCategory myCategory =
          Get.put(subCategory, tag: subCategory.path, permanent: true);
    } catch (e) {
      log(e.toString());
    }
  }
}
