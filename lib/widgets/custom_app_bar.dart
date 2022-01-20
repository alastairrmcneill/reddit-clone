import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for something',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[700],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
