// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:moviesandmoviez/pages/search.dart';

import '../details.dart';
import '../favoriler.dart';
import '../helper/datahelper.dart';

class TopRated extends StatefulWidget {
  final List toprated;
  const TopRated({super.key, required this.toprated});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
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
                  builder: (context) => const Searching(),
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
          ),
        ],
        title: const TextModifier(
            text: 'Movies And Moviez ',
            size: 22,
            color: Colors.white,
            con: false),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            const TextModifier(
                text: 'Top Rated', color: Colors.white, size: 26, con: false),
            Expanded(
              child: Container(
                child: GridView.builder(
                    itemCount: widget.toprated.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 35, crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                  id: widget.toprated[index]['id'],
                                  name: widget.toprated[index]['title'],
                                  description: widget.toprated[index]
                                      ['overview'],
                                  bannerurl: 'Http://image.tmdb.org/t/p/w500' +
                                      (widget.toprated[index]['backdrop_path']),
                                  posterurl: 'Http://image.tmdb.org/t/p/w500' +
                                      (widget.toprated[index]['poster_path']),
                                  vote: (widget.toprated[index]['vote_average'])
                                      .toString(),
                                  launchOn: widget.toprated[index]
                                      ['release_date']),
                            ),
                          );
                        },
                        child: trCreate(index),
                      );
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }

  trCreate(int index) {
    return Column(children: [
      Hero(
        tag: widget.toprated[index]['id'],
        child: Container(
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('Http://image.tmdb.org/t/p/w500' +
                      (widget.toprated[index]['poster_path'])))),
        ),
      ),
      Expanded(
        child: TextModifier(
            text: widget.toprated[index]['title'],
            size: 16,
            color: Colors.white,
            con: false),
      )
    ]);
  }
}
