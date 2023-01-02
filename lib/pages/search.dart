import 'package:flutter/material.dart';

import '../favoriler.dart';
import '../helper/datahelper.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Favorites(),
                ),
              );
            }),
            icon: const Icon(Icons.favorite),
            color: Colors.red,
          )
        ],
        title: const TextModifier(
            text: 'Movies And Moviez ',
            size: 22,
            color: Colors.white,
            con: false),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
