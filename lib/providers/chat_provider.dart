import 'package:flutter/material.dart';

import '../models/chat_model.dart';
import '../services/api_services.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];

  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessages({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatId: 0));
    notifyListeners();
  }

  Future<void> addChatGPTAsnwers({
    required String msg,
    required String chosenModel,
  }) async {
    chatList.addAll(
        await ApiServices.sendMessage(chatModel: chosenModel, msg: msg));
    notifyListeners();
  }
}
