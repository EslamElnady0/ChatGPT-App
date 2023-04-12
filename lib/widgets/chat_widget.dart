import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String msg;
  final int chatIndex;

  const ChatWidget({super.key, required this.chatIndex, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 1 ? kCardColor : kScaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 1
                      ? AssetsManager.chatImage
                      : AssetsManager.userImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(child: TextWidget(label: msg)),
                chatIndex ==1? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children:const [
                  Icon(Icons.thumb_up_alt_outlined,color: Colors.white,),
                  SizedBox(width: 5),
                  Icon(Icons.thumb_down_alt_outlined,color: Colors.white,),

                ],):const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
