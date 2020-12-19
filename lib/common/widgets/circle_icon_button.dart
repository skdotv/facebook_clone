import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;
  final Color color;

  const CircleIconButton(
      {Key key,
      @required this.icon,
      @required this.onPressed,
      @required this.iconSize,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(
          this.icon,
        ),
        onPressed: this.onPressed,
        color: this.color ?? Colors.black,
        iconSize: this.iconSize,
      ),
    );
  }
}
