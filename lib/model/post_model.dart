import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reddit_clone/model/community_model.dart';
import 'package:reddit_clone/model/user_model.dart';
import 'package:intl/intl.dart';

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
    this.description = '',
    this.imageURL = '',
    required this.likes,
    required this.comments,
  });

  static Post fromJSON(Map<String, Object?> json) {
    final timeStamp = json['timeStamp'] as Timestamp;

    Post post = Post(
      community: Community(
        iconURL: 'assets/images/communities/assetto_corsa.jpeg',
        name: 'r/assettocorsa',
      ),
      user: currentUser,
      timestamp: timeStamp.toDate(),
      title: json['title'] as String,
      description: json['description'] as String,
      imageURL: json['imageURL'] as String,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
    );
    return post;
  }
}
