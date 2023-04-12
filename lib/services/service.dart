import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services{

  static Future<void> showBottomSheet({required BuildContext context}) async{

    await showModalBottomSheet(
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        backgroundColor: kScaffoldBackgroundColor,context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(children: const [
          TextWidget(label: 'Chosen Model : ',fontSize: 16,),

        ]),
      );
    });
  }
}