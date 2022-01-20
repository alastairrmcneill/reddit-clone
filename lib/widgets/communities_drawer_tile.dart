import 'package:flutter/material.dart';
import 'package:reddit_clone/model/community_model.dart';

class CommunitiesDrawerTile extends StatelessWidget {
  final Community community;

  const CommunitiesDrawerTile({Key? key, required this.community}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(community.iconURL),
              ),
              Text(
                community.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
