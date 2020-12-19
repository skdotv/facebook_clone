import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/common/widgets/widgets.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({Key key, @required this.currentUser, @required this.stories})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: this.stories.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _addStoryWidget(currentUser: this.currentUser);
            } else {
              Story _storyModel = this.stories[index - 1];
              return _StoryCard(
                currentUser: this.currentUser,
                story: _storyModel,
              );
            }
          }),
    );
  }

  Widget _addStoryWidget({
    User currentUser,
  }) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          width: 120,
          height: 200,
        ),
        Positioned(
          right: 6,
          top: 12,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  currentUser.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            width: 108,
            height: 120,
          ),
        ),
        Positioned(
          bottom: 50,
          left: 50,
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.facebookBlue,
                border: Border.all(
                  color: Colors.grey[200],
                  width: 3.0,
                )),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.add,
              ),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 30,
          child: SizedBox(
            width: 100,
            child: Text(
              "Create a story",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StoryCard extends StatelessWidget {
  final User currentUser;
  final Story story;
  _StoryCard({@required this.currentUser, @required this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                this.story.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          width: 120,
          height: 200,
        ),
        Positioned(
          left: 18,
          top: 18,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: !this.story.isViewed
                    ? Border.all(width: 2, color: Palette.facebookBlue)
                    : Border.all(width: 2, color: Colors.grey[500])),
            child: ProfileAvatar(
              radius: 18,
              imageUrl: this.story.user.imageUrl,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          height: double.infinity,
          width: 120,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 20,
          child: SizedBox(
            width: 100,
            child: Text(
              this.story.user.name,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
