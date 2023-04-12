import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({Key? key}) : super(key: key);

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String currentModel = 'babbage';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServices.getModels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: TextWidget(label: snapshot.error.toString()));
          }
         return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : FittedBox(
                child: DropdownButton(
                    iconEnabledColor: Colors.white,
                    dropdownColor: kScaffoldBackgroundColor,
                    value: currentModel,
                    items:  List<DropdownMenuItem<String>>.generate(
                        snapshot.data!.length,
                            (index) => DropdownMenuItem(

                            value: snapshot.data![index].id,
                            child: TextWidget(
                              label:snapshot.data![index].id,
                              fontSize: 15,
                            ))),
                    onChanged: (value) {
                      setState(() {
                        currentModel = value.toString();
                      });
                    }),
              );
        });
  }
}
