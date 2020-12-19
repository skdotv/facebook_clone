import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_facebook/common/widgets/widgets.dart';
import 'package:flutter_facebook/config/palette.dart';
import '../../models/models.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUser;

  const Rooms({Key key, @required this.onlineUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.onlineUser.sort((a, b) {
      if (b.isActive) {
        return 1;
      }
      return -1;
    });
    return Container(
      height: 70,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + this.onlineUser.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: _createRoomButtonWidget(),
              );
            } else {
              final User user = this.onlineUser[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileAvatar(
                  isActiveIcon: true,
                  isActive: user.isActive,
                  imageUrl: user.imageUrl,
                ),
              );
            }
          }),
    );
  }

  Widget _createRoomButtonWidget() {
    return OutlineButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        width: 2.0,
        color: Colors.blueAccent[100],
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.video_call),
              onPressed: () {},
              iconSize: 35.0,
              color: Colors.white,
            ),
          ),
          Text(
            "Create \nRoom",
            style: TextStyle(
              fontSize: 12,
            ),
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
