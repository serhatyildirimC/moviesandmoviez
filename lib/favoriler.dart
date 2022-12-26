// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moviesandmoviez/helper/datahelper.dart';
import 'package:moviesandmoviez/model/moviee.dart';
import 'details.dart';

class Favorites extends StatefulWidget {
  Favorites({
    Key? key,
  }) : super(key: key);
  List<Moviee> favorites = [];
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    widget.favorites = [];
    loadfavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favorites.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const TextModifier(
              text: 'Your Favorite Movies',
              color: Colors.white,
              size: 30,
              con: false),
        ),
        body: Center(
          child: Container(
            color: Colors.transparent,
            child: const TextModifier(
              text: 'There is no favorite film',
              color: Colors.white,
              size: 20,
              con: false,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const TextModifier(
            text: 'Your Favorite Movies',
            color: Colors.white,
            size: 30,
            con: false),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: widget.favorites.length,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      id: widget.favorites[index].id,
                      name: widget.favorites[index].isim,
                      description: widget.favorites[index].overview,
                      bannerurl: 'Http://image.tmdb.org/t/p/w500' +
                          (widget.favorites[index].backdrop_path),
                      posterurl: 'Http://image.tmdb.org/t/p/w500' +
                          (widget.favorites[index].poster_path),
                      vote: (widget.favorites[index].vote_average.toString()),
                      launchOn: widget.favorites[index].release_date,
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(7),
                    height: 250,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          alignment: Alignment.centerLeft,
                          image: NetworkImage(
                            'Http://image.tmdb.org/t/p/w500' +
                                (widget.favorites[index].backdrop_path),
                          ),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextModifier(
                          text: widget.favorites[index].isim,
                          color: Colors.white,
                          size: 20,
                          con: false,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: (8.0)),
                          child: TextModifier(
                            text: (widget.favorites[index].overview),
                            color: Colors.white,
                            size: 14,
                            con: true,
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: const Icon(Icons.favorite),
                    color: Colors.red,
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void loadfavorites() {
    var box = Hive.box<Moviee>('favorites');
    for (var element in box.values) {
      widget.favorites.add(element);
    }
  }
}
