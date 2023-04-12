import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:chatgpt/services/service.dart';
import 'package:chatgpt/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/chat_textfield.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;

  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        title: const Text(
          "ChatGPT",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          IconButton(onPressed: () async{
           await Services.showBottomSheet(context: context);
          }, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ChatWidget(

                    chatIndex:
                        int.parse(chatMessages[index]["chatIndex"].toString()),
                    msg: chatMessages[index]["msg"].toString(),
                  );
                },
                itemCount: chatMessages.length,
              ),
            ),

            if (_isTyping) ...[
              const SizedBox(
                height: 10,
              ),
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: kCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: ChatTextField(
                          textEditingController: textEditingController),
                    ),
                    IconButton(
                        onPressed: () async{
                          await ApiServices.getModels();
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ))
                  ]),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
