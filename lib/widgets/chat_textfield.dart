import 'package:flutter/material.dart';


class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {},
      controller: textEditingController,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration.collapsed(
          hintStyle: TextStyle(color: Colors.grey),
          hintText: "Hello how can I help you ?"),
    );
  }
}
