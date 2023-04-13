import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt/constants/api_constants.dart';
import 'package:chatgpt/models/chat_model.dart';
import 'package:chatgpt/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/models"),
          headers: {"Authorization": "Bearer $apiKey"});
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse["error"]["message"]);
      }
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (err) {
      print('error $err');
      rethrow;
    }
  }

  static Future<List<ChatModel>> sendMessage(
      {required String chatModel, required String msg}) async {
    try {
      var response = await http.post(Uri.parse("$baseUrl/chat/completions"),
          headers: {
            "Authorization": "Bearer $apiKey",
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "model": chatModel,
            "messages": [
              {"role": "user", "content": msg}
            ],
            "temperature": 0.7
          }));
      List<ChatModel> chatList = [];
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse["error"]["message"]);
      }
      if (jsonResponse["choices"].length > 0) {
        // log(jsonResponse["choices"][0]["message"]["content"]);
        chatList = List.generate(jsonResponse["choices"].length,
            (index) => ChatModel(msg: msg, chatId: 1));
      }
      return chatList;
    } catch (err) {
      log('error $err');
          rethrow;
    }
  }
}
