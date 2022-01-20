import 'package:flutter/material.dart';
import 'package:reddit_clone/model/user_model.dart';
import 'package:reddit_clone/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xFF424242),
            width: 1,
          ),
        ),
        elevation: 0,
        title: CustomAppBar(),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                children: [
                  Text(
                    'Your Communities',
                    style: TextStyle(
                      color: Colors.white,
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
    );
  }
}
