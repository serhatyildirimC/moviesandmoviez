import 'package:flutter/material.dart';
import 'package:moviesandmoviez/pages/search.dart';

import '../favoriler.dart';
import '../helper/datahelper.dart';

class TvShowsPage extends StatefulWidget {
  const TvShowsPage({Key? key}) : super(key: key);

  @override
  State<TvShowsPage> createState() => _TvShowsPageState();
}

class _TvShowsPageState extends State<TvShowsPage> {
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
