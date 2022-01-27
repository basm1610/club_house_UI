import 'package:flutter/material.dart';
import 'package:flutter_app22/data.dart';

class UserProfileImage extends StatelessWidget {
  final String imageURl;
  final double size;

  const UserProfileImage({
    Key? key,
    required this.imageURl,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size/2 - size/10),
      child: Image.network(
        imageURl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
