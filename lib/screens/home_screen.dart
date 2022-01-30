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
      body: StreamBuilder(
        stream: PostsDatabase.readAllPosts(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              Post post = Post.fromJSON(data);
              return PostTile(post: post);
            },
          );
        },
      ),
    );
  }
}
