import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/common/widgets/widgets.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/palette.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            _sliverAppBar(),
            _topPostContainer(),
            _creatRoomAndUsersWidget(),
            _storiesWidger(),
            _postListWidget(),
          ],
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: Text(
        "facebook",
        style: TextStyle(
            color: Palette.facebookBlue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2),
      ),
      centerTitle: false,
      floating: true,
      actions: [
        CircleIconButton(
          icon: Icons.search,
          iconSize: 30.0,
          color: Colors.black,
          onPressed: () {},
        ),
        CircleIconButton(
          icon: MdiIcons.facebookMessenger,
          iconSize: 30.0,
          color: Colors.black,
          onPressed: () {},
        )
      ],
    );
  }

  SliverToBoxAdapter _topPostContainer() {
    return SliverToBoxAdapter(
      child: TopPostContainer(
        currentUser: currentUser,
        liveOnPressed: () {},
        photoOnPressed: () {},
        roomOnPressed: () {},
      ),
    );
  }

  SliverToBoxAdapter _creatRoomAndUsersWidget() {
    return SliverToBoxAdapter(child: Rooms(onlineUser: onlineUsers));
  }

  SliverToBoxAdapter _storiesWidger() {
    return SliverToBoxAdapter(
      child: Stories(currentUser: currentUser, stories: stories),
    );
  }

  SliverList _postListWidget() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final Post _post = posts[index];
          return PostContainer(post: _post);
        },
        childCount: posts.length,
      ),
    );
  }
}
