import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reddit_clone/services/database_service.dart';

class Community {
  final String iconURL;
  final String name;

  Community({
    required this.iconURL,
    required this.name,
  });

  static Future<Community> fromJSON(String communityID) async {
    DocumentSnapshot<Map<String, Object?>> communityData = await PostsDatabase.readCommunity(communityID);

    if (communityData.exists) {
      Map<String, dynamic>? data = communityData.data()!;
      return Community(
        iconURL: data['iconURL'] as String,
        name: data['name'] as String,
      );
    }
    return Community(
      iconURL: 'assets/images/communities/assetto_corsa.jpeg',
      name: 'r/assettocorsa',
    );
  }
}
