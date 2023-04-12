import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';


class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(color: kCardColor,
      child: Padding(padding: const EdgeInsets.all(8.0), child:Row(children: [
        Image.asset(AssetsManager.userImage,height: 30,width: 30,),
        const SizedBox(width: 8,),
        const TextWidget(label: "Hello thats a Text"),
      ],),),);
  }
}
