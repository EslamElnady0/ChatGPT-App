import 'dart:developer';

import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/models/chat_model.dart';
import 'package:chatgpt/providers/models_provider.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:chatgpt/services/service.dart';
import 'package:chatgpt/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../widgets/chat_textfield.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late ScrollController _listScrollController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    _listScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    _listScrollController.dispose();
    super.dispose();
  }

  List<ChatModel> chatList = [];

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
            IconButton(
                onPressed: () async {
                  await Services.showBottomSheet(context: context);
                },
                icon: const Icon(Icons.more_vert))
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  controller: _listScrollController,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      chatIndex: chatList[index].chatId,
                      msg: chatList[index].msg,
                    );
                  },
                  itemCount: chatList.length,
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
              ],
              Card(
                elevation: 1,
                child: Container(
                  color: kCardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ChatTextField(
                            focusNode: focusNode,
                            onSubmitted: (value) async {
                              sendMessageToChat(modelsProvider: modelsProvider);
                              FocusScope.of(context).unfocus();
                            },
                            textEditingController: textEditingController),
                      ),
                      IconButton(
                          onPressed: () async {
                            await sendMessageToChat(
                                modelsProvider: modelsProvider);
                            FocusScope.of(context).unfocus();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ))
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void scrollListToEnd() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  Future<void> sendMessageToChat(
      {required ModelsProvider modelsProvider}) async {
    try {
      setState(() {
        _isTyping = true;
        chatList.add(ChatModel(msg: textEditingController.text, chatId: 0));
        textEditingController.clear();
        focusNode.unfocus();
      });

      chatList.addAll(await ApiServices.sendMessage(
          chatModel: modelsProvider.getCurrentModel,
          msg: textEditingController.text));
      setState(() {});
    } catch (err) {
      log(err.toString());
    } finally {
      setState(() {
        _isTyping = false;
        scrollListToEnd();
      });
    }
  }
}
