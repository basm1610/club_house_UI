import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app22/models/rooming.dart';
import 'package:flutter_app22/widget/room_screen_profile.dart';
import 'package:flutter_app22/widget/user_profile_image.dart';

import '../data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 150,
        leading: TextButton.icon(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.chevron_down,
            size: 15,
          ),
          label: Text(
            'Hallway',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.doc),
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
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 12,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(13.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 15.0,
                children: room.speakers
                    .map((e) => RoomScreenProfile(
                          name: e.firstName,
                          imageUrl: e.imageURL,
                          size: 60,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Followed by Speakers',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(13.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: .6,
                mainAxisSpacing: 15.0,
                children: room.followedBySpeakers
                    .map((e) => RoomScreenProfile(
                          name: e.firstName,
                          imageUrl: e.imageURL,
                          size: 60,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Others in the room',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(13.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: .6,
                mainAxisSpacing: 15.0,
                children: room.others
                    .map((e) => RoomScreenProfile(
                          name: e.firstName,
                          imageUrl: e.imageURL,
                          size: 60,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 60),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                  '✌ Leave quietly',
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Colors.grey[300],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(CupertinoIcons.add,
                    size: 30,),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(CupertinoIcons.hand_raised,
                      size: 30,),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
