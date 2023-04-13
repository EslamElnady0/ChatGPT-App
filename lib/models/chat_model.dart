class ChatModel{
  final String msg;
  final int chatId;

  ChatModel({required this.msg, required this.chatId,});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
        msg: json["msg"], chatId: json["chatId"]);
  }
}