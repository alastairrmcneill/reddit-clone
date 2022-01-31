import 'package:flutter/material.dart';
import 'package:reddit_clone/model/community_model.dart';

class CommunitiesDrawerTile extends StatelessWidget {
  final Community community;

  const CommunitiesDrawerTile({Key? key, required this.community}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(community.iconURL),
                  radius: 12,
                ),
                SizedBox(width: 15),
                Text(
                  'r/${community.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.star_border_rounded,
              color: Colors.grey[500],
            )
          ],
        ),
      ),
    );
  }
}
