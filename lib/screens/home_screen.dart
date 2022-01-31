import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reddit_clone/model/post_model.dart';
import 'package:reddit_clone/model/user_model.dart';
import 'package:reddit_clone/services/database_service.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: FirebaseApi.listAll,
        child: Icon(Icons.read_more),
      ),
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xFF424242),
            width: 1,
          ),
        ),
        elevation: 0,
        title: CustomAppBar(),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: Scaffold.of(context).openEndDrawer,
              icon: Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(currentUser.iconURL),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      drawer: CustomLeftDrawer(),
      endDrawer: CustomRightDrawer(),
      body: StreamBuilder<List<Post>>(
        stream: PostsDatabase.getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> postsSnapshot) {
          if (postsSnapshot.hasError) {
            return Text('Error: ${postsSnapshot.error}');
          }
          switch (postsSnapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text("Loading...");
            default:
              return ListView(
                children: postsSnapshot.data!.map((Post post) {
                  return PostTile(post: post);
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
