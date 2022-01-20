import 'package:flutter/material.dart';

class DrawerHeaderTile extends StatelessWidget {
  final Color color;
  final String text;

  const DrawerHeaderTile({Key? key, required this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Container(
            color: color,
            width: 3,
            height: 30,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
