import 'package:flutter/material.dart';
import 'package:reddit_clone/model/user_model.dart';
import 'widgets.dart';

class CustomLeftDrawer extends StatelessWidget {
  const CustomLeftDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF424242),
                        width: 1,
                      ),
                    ),
                  ),
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        const DrawerHeaderTile(color: Colors.red, text: 'Home'),
                        DrawerHeaderTile(color: Theme.of(context).scaffoldBackgroundColor, text: 'Popular'),
                        DrawerHeaderTile(color: Theme.of(context).scaffoldBackgroundColor, text: 'Awarded'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Your Communities',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                ...(currentUser.communities).map((community) {
                  return CommunitiesDrawerTile(community: community);
                }).toList()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 40.0,
              top: 20,
              left: 8,
              right: 8,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.grey[700],
                    size: 30,
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Create a community',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
