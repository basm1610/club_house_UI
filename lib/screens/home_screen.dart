import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app22/data.dart';
import 'package:flutter_app22/widget/room_card.dart';
import 'package:flutter_app22/widget/user_profile_image.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.envelope_open,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.calendar,
              size: 26,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              size: 26,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
              child: UserProfileImage(
                size: 32,
                imageURl: currentUser.imageURL,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            children: [
              ...roomList.map((e) => RoomCard(room: e)),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.add,
                size: 21,
                color: Colors.white,
              ),
              label: Text(
                'Start a room',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  primary: Theme.of(context).accentColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
