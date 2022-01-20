import 'package:reddit_clone/model/community_model.dart';
import 'package:reddit_clone/model/user_model.dart';

class Post {
  final Community community;
  final User user;
  final DateTime timestamp;
  final String title;
  final String description;
  final String imageURL;
  final int likes;
  final int comments;

  Post({
    required this.community,
    required this.user,
    required this.timestamp,
    required this.title,
    required this.description,
    this.imageURL = '',
    required this.likes,
    required this.comments,
  });
}
