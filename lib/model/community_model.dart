import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reddit_clone/services/database_service.dart';

class Community {
  final String iconURL;
  final String name;

  Community({
    required this.iconURL,
    required this.name,
  });

  factory Community.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map;
    return Community(
      iconURL: data['iconURL'] as String,
      name: data['name'] as String,
    );
  }

  static Community fromJSON(Map<String, dynamic> json) {
    return Community(
      iconURL: json['iconURL'] as String,
      name: json['name'] as String,
    );
  }

  static Community fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      return Community(
        iconURL: data['iconURL'],
        name: data['name'],
      );
    }
    return Community(
      iconURL: 'assets/images/users/alastair.png',
      name: 'u/alimcneill',
    );
  }
}
