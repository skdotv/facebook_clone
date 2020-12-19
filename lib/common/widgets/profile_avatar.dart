import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool isActiveIcon;
  final double radius;

  const ProfileAvatar(
      {Key key,
      @required this.imageUrl,
      this.isActive = false,
      this.isActiveIcon = false,
      this.radius = 20.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: this.radius,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(this.imageUrl),
        ),
        this.isActiveIcon
            ? Positioned(
                bottom: 8,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      color: this.isActive ? Palette.online : Colors.grey,
                      shape: BoxShape.circle),
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
