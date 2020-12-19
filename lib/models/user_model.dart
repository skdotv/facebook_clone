import 'package:meta/meta.dart';

class User {
  final String name;
  final String imageUrl;
  final bool isActive;

  const User({
    @required this.name,
    @required this.imageUrl,
    @required this.isActive,
  });
}
