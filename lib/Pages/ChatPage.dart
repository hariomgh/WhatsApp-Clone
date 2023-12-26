import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/CustomCard.dart';
import '../Model/ChatModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Shubham sir",
      isGroup: false,
      currentMessage: "hello",
      time: "04:00",
      icon: "person.svg",
    ),

    ChatModel(
      name: "Hariom",
      isGroup: false,
      currentMessage: "hello how are you?",
      time: "04:00",
      icon: "person.svg",
    ),

    ChatModel(
      name: "ChatBox",
      isGroup: true,
      currentMessage: "Gaurav kaam karo ui ka jaldi se",
      time: "04:00",
      icon: "group.svg",
    ),

    ChatModel(
      name: "Rohit",
      isGroup: false,
      currentMessage: "hello how are you?",
      time: "04:00",
      icon: "person.svg",
    ),

    ChatModel(
      name: "Nishant",
      isGroup: false,
      currentMessage: "Jyada dsa mat kar pagal ho jayega",
      time: "04:00",
      icon: "person.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          key: Key(index.toString()),
          chatModel: chats[index],
        ),
      ),

    );
  }
}
