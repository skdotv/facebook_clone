import 'package:flutter/material.dart';
import 'package:flutter_facebook/common/widgets/widgets.dart';

import '../../models/models.dart';

class TopPostContainer extends StatelessWidget {
  final User currentUser;
  final VoidCallback liveOnPressed;
  final VoidCallback photoOnPressed;

  final VoidCallback roomOnPressed;

  const TopPostContainer(
      {Key key,
      this.currentUser,
      this.liveOnPressed,
      this.photoOnPressed,
      this.roomOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      // height: 100.0,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: this.currentUser.imageUrl),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.84,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                      hintText: "Write something here...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                    onPressed: this.liveOnPressed,
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text("Live")),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                    onPressed: this.photoOnPressed,
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text("Photo")),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                    onPressed: this.roomOnPressed,
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purple,
                    ),
                    label: Text("Room")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
