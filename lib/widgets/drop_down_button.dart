import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/providers/models_provider.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({Key? key}) : super(key: key);

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context,listen: false);
    String currentModel = modelsProvider.getCurrentModel;
    return FutureBuilder(
        future: modelsProvider.getAllModels(),
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
                      modelsProvider.setCurrentModel(value.toString());

                    }),
              );
        });
  }
}
