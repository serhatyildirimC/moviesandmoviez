// ignore_for_file: prefer_interpolation_to_compose_strings, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:moviesandmoviez/helper/datahelper.dart';

import '../details.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TextModifier(
          text: 'Trending',
          size: 26,
          color: Colors.white,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                          id: trending[index]['id'],
                          name: trending[index]['title'] ??
                              trending[index]['name'],
                          description: trending[index]['overview'],
                          bannerurl: 'Http://image.tmdb.org/t/p/w500' +
                              (trending[index]['backdrop_path']),
                          posterurl: 'Http://image.tmdb.org/t/p/w500' +
                              (trending[index]['poster_path']),
                          vote: (trending[index]['vote_average'].toString()),
                          launchOn: trending[index]['release_date'] ??
                              trending[index]['first_air_date']),
                    ),
                  );
                },
                child: SizedBox(
                  width: 140,
                  child: Column(children: [
                    Hero(
                      tag: trending[index]['id'],
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    'Http://image.tmdb.org/t/p/w500' +
                                        (trending[index]['poster_path'])))),
                      ),
                    ),
                    TextModifier(
                      text: trending[index]['title'] ?? trending[index]['name'],
                      size: 16,
                      color: Colors.white,
                    )
                  ]),
                ),
              );
            }),
          ),
        ),
      ]),
    );
  }
}
