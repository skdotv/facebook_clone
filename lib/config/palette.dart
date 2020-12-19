import 'package:flutter/material.dart';

class Palette {
  static Color scaffold = Colors.grey[300];

  static const Color facebookBlue = Color(0xFF1777F2);
  static LinearGradient createRoomGradient = LinearGradient(
    colors: <Color>[Color(0xFF496AE1), Color(0xFFCE48B1)],
  );
  static const Color createRoomColor1 = Color(0xFF496AE1);
  static const Color createRoomColor2 = Color(0xFFCE48B1);

  static const Color online = Color(0xFF4BCB1F);
  static Gradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Colors.transparent, Colors.black26],
  );
}
