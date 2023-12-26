import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Screens/IndividualPage.dart';

import '../Model/ChatModel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({ required Key key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualPage(
          chatModel: chatModel,
          key: Key(toString()),
        )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                chatModel.isGroup? "assets/groups.svg" : "assets/person.svg" ,
                color: Colors.white,
                height: 30,
                width: 30,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(chatModel.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 3,),
                Text(
                  chatModel.currentMessage,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 20),
            child: Divider(
              thickness: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
