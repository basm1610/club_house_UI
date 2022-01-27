import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app22/data.dart';
import 'package:flutter_app22/widget/user_profile_image.dart';

class RoomScreenProfile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomScreenProfile({
    Key? key,
    required this.name,
    required this.imageUrl,
    this.size = 40,
    this.isNew = false,
    this.isMuted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              UserProfileImage(
                imageURl: imageUrl,
                size: size,
              ),
              if (isNew)
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Text(
                      '🎉',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              if (isMuted)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Icon(
                        CupertinoIcons.mic_slash_fill,
                        size: 15,
                      )),
                ),
            ],
          ),
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
