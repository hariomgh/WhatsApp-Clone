import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Model/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({required Key key, required this. chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        setState(() {
          show = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.back,size: 24,),
                CircleAvatar(
                  child: SvgPicture.asset(
                    widget.chatModel.isGroup? "assets/groups.svg" : "assets/person.svg" ,
                    color: Colors.white,
                    height: 30,
                    width: 30,
                  ),
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Last seen today at 12:00",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            PopupMenuButton<String>(
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (BuildContext contesxt){
                  return [
                    PopupMenuItem(
                      child: Text("View Contact"),
                      value:"View Contact" ,
                    ),
                    PopupMenuItem(
                      child: Text("Media, Links, Docs"),
                      value:"Media, Links, Docs" ,
                    ),
                    PopupMenuItem(
                      child: Text("whatsapp web"),
                      value:"Watsapp web" ,
                    ),
                    PopupMenuItem(
                      child: Text("Search"),
                      value:"Search",
                    ),
                    PopupMenuItem(
                      child: Text("Mute Notification"),
                      value:"Mute Notification" ,
                    ),
                    PopupMenuItem(
                      child: Text("Wallpaper"),
                      value:"Wallpaper" ,
                    ),
                  ];
                }),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Card(
                              margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                              ),
                                child: TextFormField(
                                  controller: _controller,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type your message",
                                    prefixIcon: IconButton(
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.emoji_emotions_outlined,
                                      ),
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(context: context, builder: (builder) => bottomSheet());
                                            },
                                            icon: Icon(Icons.attach_file),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.camera_alt),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, right: 2, left: 2),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.greenAccent,
                            child: IconButton(
                              icon: Icon(Icons.mic),
                              onPressed: () {},
                            ),
          
                          ),
                        ),
                      ],
                    ),
                    show?emojiSelect() : Container(),
                  ],
                ),
              ),
            ],
          ),
          onWillPop: () {
            if(show){
              setState(() {
                show = false;
              });
            }
            else{
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      // child: Card(
      //   // margin: EdgeInsets.all(18),
      // ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(
                    Icons.insert_drive_file, Colors.indigo, "Document"),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(Icons.headset, Colors.orange, "Audio"),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.location_pin, Colors.teal, "Location"),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.person, Colors.blue, "Contact"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

  //emoji picker is not working
  Widget emojiSelect()
  {
    return Container(
      height: 300,
      child: EmojiPicker(
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState( () {
            var emoji;
            _controller.text = _controller.text + emoji?.emoji;
          }
          );
        },
      ),
    );
  }
}
