import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reddit_clone/model/community_model.dart';

class PostsDatabase {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> readAllPosts() {
    return _db
        .collection('Posts')
        .orderBy(
          'timeStamp',
          descending: true,
        )
        .snapshots();
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> readCommunity(String communityID) {
    return _db.collection('commmunities').doc(communityID).get();
  }
}
