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

User currentUser = User(
  iconURL: 'assets/images/users/alastair.png',
  username: 'u/alimcneill',
  communities: [
    Community(
      iconURL: 'assets/images/communities/assetto_corsa.jpeg',
      name: 'r/assettocorsa',
    ),
    Community(
      iconURL: 'assets/images/communities/battle_stations.png',
      name: 'r/battlestations',
    ),
    Community(
      iconURL: 'assets/images/communities/chess_beginners.png',
      name: 'r/chessbeginners',
    ),
    Community(
      iconURL: 'assets/images/communities/crappy_designs.jpeg',
      name: 'r/CrappyDesigns',
    ),
    Community(
      iconURL: 'assets/images/communities/data_is_beautiful.jpeg',
      name: 'r/dataisbeautiful',
    ),
    Community(
      iconURL: 'assets/images/communities/desk_setup.png',
      name: 'r/desksetup',
    ),
    Community(
      iconURL: 'assets/images/communities/f1_technical.png',
      name: 'r/F1Technical',
    ),
    Community(
      iconURL: 'assets/images/communities/formula_dank.png',
      name: 'r/formuladank',
    ),
    Community(
      iconURL: 'assets/images/communities/formula1.png',
      name: 'r/Formula1',
    ),
    Community(
      iconURL: 'assets/images/communities/interesting_as_fuck.png',
      name: 'r/InterestingAsFuck',
    ),
    Community(
      iconURL: 'assets/images/communities/life_pro_tips.png',
      name: 'r/LifeProTips',
    ),
    Community(
      iconURL: 'assets/images/communities/made_me_smile.png',
      name: 'r/MadeMeSmile',
    ),
    Community(
      iconURL: 'assets/images/communities/map_porn.png',
      name: 'r/MapPorn',
    ),
    Community(
      iconURL: 'assets/images/communities/next_fucking_level.png',
      name: 'r/nextfuckinglevel',
    ),
    Community(
      iconURL: 'assets/images/communities/shower_thoughts.png',
      name: 'r/ShowerThoughts',
    ),
    Community(
      iconURL: 'assets/images/communities/uk_personal_finance.png',
      name: 'r/UKPersonalFinance',
    ),
  ],
);
