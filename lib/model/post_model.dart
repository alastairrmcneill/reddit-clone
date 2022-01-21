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
    this.description = '',
    this.imageURL = '',
    required this.likes,
    required this.comments,
  });
}

List<Post> posts = [
  Post(
    community: Community(iconURL: 'assets/images/communities/formula1.png', name: 'r/Forumla1'),
    user: User(iconURL: 'assets/images/users/alastair.png', username: 'u/Avarto'),
    timestamp: DateTime(2022, 1, 21, 10, 12),
    title: 'Ted interviewing Lewis during his GP2 days (Nurburgring 2006)',
    imageURL: 'assets/images/posts/1.jpeg',
    likes: 1822,
    comments: 96,
  ),
  Post(
    community: Community(iconURL: 'assets/images/communities/uk_personal_finance.png', name: 'r/UKPersonalFinance'),
    user: User(iconURL: 'assets/images/users/alastair.png', username: 'u/Basic-Ad4723'),
    timestamp: DateTime(2022, 1, 21, 10, 11),
    title: 'my dad wants his gifted deposit back',
    description:
        '''I am in the process of buying a house with my girlfriend and my dad originally gave us a gifted deposit of £2500. Our mortgage application has been accepted and we accepted their offer. Now my dad wants the gifted deposit back because he had a letter from our solicitor askign for ID checks etc. He has not rang up the solicitors stating we have committed fraud and that he wants the gifted deposit back. He signed the gifted deposit certificate from our lender.

I have sent him back the £2500, my girlfriends parents have said they will give us the £2500 as a gifted deposit that my dad was going to originally give. What can I do now?''',
    likes: 232,
    comments: 10,
  ),
];
