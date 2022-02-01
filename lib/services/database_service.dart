import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:reddit_clone/model/community_model.dart';
import 'package:reddit_clone/model/firebase_file.dart';
import 'package:reddit_clone/model/post_model.dart';
import 'package:reddit_clone/model/user_model.dart';

import 'dart:io';

import 'package:reddit_clone/model/firebase_file.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostsDatabase {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<List<Post>> getData() async* {
    var postsStream = _db.collection("Posts").orderBy("timeStamp", descending: true).snapshots();
    List<Post> posts = [];

    await for (var postSnapshot in postsStream) {
      posts.clear();
      for (var postDoc in postSnapshot.docs) {
        var post;
        if (postDoc["userID"] != null) {
          var userSnapshot = await _db.collection("Users").doc(postDoc['userID']).get();
          var commmunitiesSnapshot = await _db.collection("Communities").doc(postDoc['communityID']).get();

          post = Post(
            community: Community.fromSnapshot(commmunitiesSnapshot),
            user: User.fromSnapshot(userSnapshot),
            timestamp: (postDoc['timeStamp'] as Timestamp).toDate(),
            title: postDoc['title'] as String,
            description: postDoc['description'] as String,
            imageURL: postDoc['imageURL'] as String,
            likes: postDoc['likes'] as int,
            comments: postDoc['comments'] as int,
          );
        } else {
          post = Post(
            community: Community(
              iconURL: 'assets/images/communities/assetto_corsa.jpeg',
              name: 'r/assettocorsa',
            ),
            user: User(
              iconURL: 'assets/images/users/alastair.png',
              username: 'u/alimcneill',
            ),
            timestamp: DateTime.now(),
            title: "",
            description: "",
            imageURL: "",
            likes: 0,
            comments: 0,
          );
        }
        posts.add(post);
      }
      yield posts;
    }
  }
}

class CommunitiesDatabase {
  // Read all
  static Stream<QuerySnapshot<Map<String, dynamic>>> readAllCommunities() {
    return FirebaseFirestore.instance.collection('Communities').snapshots();
  }
}

class FirebaseApi {
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) => Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll() async {
    final ref = FirebaseStorage.instance.ref('Commmunities/');
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);
    print(urls);
    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }
}
