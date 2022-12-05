// ignore_for_file: prefer_interpolation_to_compose_strings, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:moviesandmoviez/helper/datahelper.dart';

import '../details.dart';

class TopratedMovies extends StatelessWidget {
  final List toprated;
  const TopratedMovies({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TextModifier(
          text: 'Top Rated Movies',
          size: 26,
          color: Colors.white,
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: toprated.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                          id: ((index + 1) * 100),
                          name: toprated[index]['title'],
                          description: toprated[index]['overview'],
                          bannerurl: 'Http://image.tmdb.org/t/p/w500' +
                              (toprated[index]['backdrop_path']),
                          posterurl: 'Http://image.tmdb.org/t/p/w500' +
                              (toprated[index]['poster_path']),
                          vote: (toprated[index]['vote_average']).toString(),
                          launchOn: toprated[index]['release_date']),
                    ),
                  );
                },
                child: SizedBox(width: 140, child: trCreate(index)),
              );
            }),
          ),
        ),
      ]),
    );
  }

  trCreate(int index) {
    return Column(children: [
      Hero(
        tag: ((index + 1) * 100),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      'Http://image.tmdb.org/t/p/w500' +
                          (toprated[index]['poster_path'])))),
        ),
      ),
      TextModifier(
        text: toprated[index]['title'],
        size: 16,
        color: Colors.white,
      )
    ]);
  }
}
