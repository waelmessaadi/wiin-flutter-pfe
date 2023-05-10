import 'dart:ui';
import 'package:untitled/screens/auth/receiver_row_view.dart';
import 'package:untitled/screens/auth/sender_row_view.dart';
import 'ChatMessagesModel.dart';
import 'global_membres.dart';
import 'package:flutter/material.dart';

//liste message
class selmi extends StatefulWidget {
  @override
  _selmi createState() => _selmi();
}

class _selmi extends State<selmi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar:  AppBar( title: Text('Messages') ),
        body: SafeArea(
          child: Column(
            children: [

              buildrecherche(),
              _body(),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildrecherche() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          alignment: Alignment.centerLeft,
          height: 60,
          child: TextField(

            decoration: InputDecoration(
              fillColor: Colors.grey,
              hintText: "Searching for ...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),

          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }


  Widget _body() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        color: Colors.white,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.only(top: 35),
          physics: BouncingScrollPhysics(),
          children: [
            _itemChats(
              avatar: 'assets/image/6.png',
              name: 'Mohamed Alaya',
              chat: 'Hey! How are you ?',
              time: '08.10',
            ),
            _itemChats(
              avatar: 'assets/image/2.png',
              name: 'Aman Gupta',
              chat: 'Hey Piyush!',
              time: '03.19',
            ),
            _itemChats(
              avatar: 'assets/image/5.png',
              name: 'John Doe',
              chat: 'this is the example message',
              time: '02.53',
            ),
            _itemChats(
              avatar: 'assets/image/3.png',
              name: 'Charlie',
              chat: 'this is the example message',
              time: '11.39',
            ),
            _itemChats(
              avatar: 'assets/image/1.png',
              name: 'Smith',
              chat: 'Okay! Done',
              time: '00.09',
            ),
            _itemChats(
              avatar: 'assets/image/4.png',
              name: 'Martin',
              chat: 'See you soon.',
              time: '00.09',
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemChats(
      {String avatar = '', name = '', chat = '', time = '00.00'}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatPage(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20),
        elevation: 0,
        child: Row(
          children: [
            Avatar(
              margin: EdgeInsets.only(right: 20),
              size: 60,
              image: avatar,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$name',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$time',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$chat',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//chatt message

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        elevation: 12,
        titleSpacing: 10,
        backgroundColor: const Color(0xffF0F0F0),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: Color(0xff0163E0),
          ),
        ),
        leadingWidth: 20,
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/image/6.png'),
          ),
          title: const Text(
            'Mohamed Alaya',
            style: TextStyle(
                color: Color(0xff1F2937), fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            'online',
            style: TextStyle(color: Color(0xffA5A5A5)),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.call,
              color: Color(0xff0163E0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.videocam_rounded,
              color: Color(0xff0163E0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.more_vert,
              color: Color(0xff0163E0),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                /* _topChat(),*/
                /*_bodyChat(),*/
                SizedBox(
                  height: 120,
                )
              ],
            ),
            _formChat(),
          ],
        ),
      ),
    );
  }



  Widget _formChat() {
    var controller = TextEditingController();
    var scrollController = ScrollController();
    var message = '';
    void animateList() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      Future.delayed(const Duration(milliseconds: 100), () {
        if (scrollController.offset !=
            scrollController.position.maxScrollExtent) {
          animateList();
        }
      });
    }

    return Column(
      children: [
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: chatModelList.length,
              itemBuilder: (context, index) =>
              chatModelList.elementAt(index).isMee
                  ? SenderRowView(
                index: index,
              )
                  : ReceiverRowView(index: index),
            )),
        Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0, left: 8),
                child: Icon(
                  Icons.camera_alt,
                  color: Color(0xff0163E0),
                ),
              ),
              Expanded(
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  controller: controller,
                  onFieldSubmitted: (value) {
                    controller.text = value;
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8),
                    border: InputBorder.none,
                    focusColor: Colors.white,
                    hintText: 'Type a message',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12, right: 10),
                child: Transform.rotate(
                  angle: 45,
                  child: const Icon(
                    Icons.attachment_outlined,
                    color: Color(0xff0163E0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    chatModelList.add(ChatModel(controller.text, true));
                    animateList();
                    controller.clear();
                  });
                },
                onLongPress: () {
                  setState(() {
                    chatModelList.add(ChatModel(controller.text, false));
                    animateList();
                    controller.clear();
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 8, right: 8),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff0163E0),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final double size;
  final image;
  final EdgeInsets margin;

  Avatar({this.image, this.size = 50, this.margin = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}