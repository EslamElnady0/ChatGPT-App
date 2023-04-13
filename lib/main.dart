import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/providers/models_provider.dart';
import 'package:chatgpt/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main(){
  runApp(const ChatGPT());
}

class ChatGPT extends StatelessWidget {
  const ChatGPT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>ModelsProvider())],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
  theme: ThemeData(
      scaffoldBackgroundColor: kScaffoldBackgroundColor,
      appBarTheme: const AppBarTheme(color: kCardColor,
  ),
      ),
      home: const ChatScreen(),
      ),
    );
  }
}
