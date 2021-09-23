import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:my_library/database.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_library/res/custom_colors.dart';

class AddCategoryDialog extends GetView<DatabaseController> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  Color? selectedColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(hintText: 'category_title'.tr),
            onSaved: (value) {
              title = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                Get.showSnackbar(GetBar(
                  duration: Duration(seconds: 1),
                  message: 'Enter a title',
                ));
                return 'empty';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          // Wrap(
          //   direction: Axis.horizontal,
          //   children: Palette.colorbuttons.map<MaterialButton>((e) {
          //     return colorButton(e);
          //   }).toList(),
          // ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            height: 120,
            child: BlockPicker(
              availableColors: Palette.colorButtons.values.toList(),
              pickerColor: selectedColor!,
              onColorChanged: (color) {
                selectedColor = color;
              },
            ),
          ),

          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  controller.addCategory(title: title, color: selectedColor);
                }
              },
              child: Text(
                'add_category'.tr,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ))
        ],
      ),
    );
  }
}
