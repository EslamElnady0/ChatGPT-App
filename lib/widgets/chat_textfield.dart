import 'package:flutter/material.dart';


class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.textEditingController,
    required this.onSubmitted,
    required this.focusNode
  });

  final TextEditingController textEditingController;
  final void Function(String)? onSubmitted;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      controller: textEditingController,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration.collapsed(
          hintStyle: TextStyle(color: Colors.grey),
          hintText: "Hello how can I help you ?"),
    );
  }
}
