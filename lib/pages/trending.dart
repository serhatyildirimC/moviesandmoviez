import 'package:flutter/material.dart';
import 'package:moviesandmoviez/pages/search.dart';

import '../favoriler.dart';
import '../helper/datahelper.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Searching(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
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
