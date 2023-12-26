import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/ChatPage.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin{
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller= TabController(length: 4, vsync: this,initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whats app clone"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {} ),
          PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt){
                return [
                  PopupMenuItem(
                    child: Text("New Group"),
                    value:"New group" ,
                  ),
                  PopupMenuItem(
                    child: Text("New Broadcast"),
                    value:"New Broadcast" ,
                  ),
                  PopupMenuItem(
                    child: Text("whatsapp web"),
                    value:"Watsapp web" ,
                  ),
                  PopupMenuItem(
                    child: Text("Starrted Message"),
                    value:"Starrted Message",
                  ),
                  PopupMenuItem(
                    child: Text("Setting"),
                    value:"Setting" ,
                  ),
                ];
              })
        ],
        bottom: TabBar(
          controller: _controller ,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt_rounded),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),

          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text("lund"),
          ChatPage(),
          Text("Gand"),
          Text("Rohit ki Gand"),
          // ChatPage(),
        ],
      ),
    );
  }
}

