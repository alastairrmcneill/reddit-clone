import 'package:cloud_firestore/cloud_firestore.dart';

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
}
