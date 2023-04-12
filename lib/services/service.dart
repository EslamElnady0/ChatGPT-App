import 'package:chatgpt/widgets/drop_down_button.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services {
  static Future<void> showBottomSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        backgroundColor: kScaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row (mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
              TextWidget(
                label: 'Chosen Model : ',
                fontSize: 16,
              ),
              Flexible(flex:2,child: ModelsDropDownWidget())
            ]),
          );
        });
  }

 // static List<DropdownMenuItem<Object?>>? get getModelsItem {
 //    List<DropdownMenuItem<Object?>>? modelsItems =
 //        List<DropdownMenuItem<Object?>>.generate(
 //            models.length,
 //            (index) => DropdownMenuItem(
 //
 //              value: models[index],
 //                    child: TextWidget(
 //                  label: models[index],
 //                  fontSize: 15,
 //                )));
 //
 //    return modelsItems;
 //  }
}
