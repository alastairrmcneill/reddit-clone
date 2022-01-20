import 'package:reddit_clone/model/community_model.dart';

class User {
  final String iconURL;
  final String username;
  final List<Community> communities;

  User({
    required this.iconURL,
    required this.username,
    this.communities = const [],
  });
}
