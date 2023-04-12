import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/service.dart';
import 'package:flutter/material.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({Key? key}) : super(key: key);

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String currentModel = 'Model1';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      iconEnabledColor: Colors.white,
      dropdownColor: kScaffoldBackgroundColor,
        value: currentModel,
        items:Services.getModelsItem,
        onChanged: (value) {
          setState(() {
            currentModel = value.toString();
          });
        });
  }
}
