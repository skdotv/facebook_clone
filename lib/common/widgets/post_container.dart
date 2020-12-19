import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/common/widgets/widgets.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/post_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PostHeader(
            post: this.post,
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              this.post.caption,
              style: TextStyle(fontSize: 12),
            ),
          ),
          this.post.imageUrl != null
              ? const SizedBox.shrink()
              : SizedBox(
                  height: 6.0,
                ),
          this.post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: CachedNetworkImage(
                    imageUrl: this.post.imageUrl,
                  ),
                )
              : const SizedBox.shrink(),
          _PostStats(
            post: this.post,
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfileAvatar(
                imageUrl: this.post.imageUrl,
              ),
              SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.post.user.name,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      )),
                  Row(
                    children: [
                      Text(
                        '${this.post.timeAgo}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.public,
                        color: Colors.grey[600],
                        size: 12.0,
                      )
                    ],
                  )
                ],
              ),
              Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  _PostStats({this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: Row(
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(MdiIcons.thumbUp),
                  onPressed: () {},
                  color: Colors.white,
                  iconSize: 10,
                ),
              ),
              SizedBox(
                width: 4.0,
              ),
              Expanded(
                child: Text(
                  '${post.likes}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 10),
                ),
              ),
              Text(
                '${post.comments} comments',
                style: TextStyle(color: Colors.grey[600], fontSize: 10),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 5.0, right: 4),
                child: Text('.',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13)),
              ),
              Text(
                '${post.shares} shares',
                style: TextStyle(color: Colors.grey[600], fontSize: 10),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.grey[400],
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _iconButton(
                icon: Icons.thumb_up_outlined, onPressed: () {}, label: "Like"),
            _iconButton(
                icon: MdiIcons.commentOutline,
                onPressed: () {},
                label: "Comment"),
            _iconButton(
                icon: MdiIcons.shareOutline, onPressed: () {}, label: "Share"),
          ],
        )
      ],
    );
  }

  Widget _iconButton({IconData icon, VoidCallback onPressed, String label}) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(icon),
          iconSize: 20,
          color: Colors.grey[600],
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        )
      ],
    );
  }
}
