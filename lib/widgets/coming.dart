// ignore_for_file: prefer_interpolation_to_compose_strings, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:moviesandmoviez/helper/datahelper.dart';

import '../details.dart';

class UpComingMovies extends StatelessWidget {
  final List upcoming;
  const UpComingMovies({Key? key, required this.upcoming}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TextModifier(
          text: 'Coming Soon',
          size: 26,
          color: Colors.white,
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: upcoming.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                          id: upcoming[index]['id'],
                          name: upcoming[index]['title'] ??
                              upcoming[index]['name'],
                          description: upcoming[index]['overview'],
                          bannerurl: 'Http://image.tmdb.org/t/p/w500' +
                              (upcoming[index]['backdrop_path']),
                          posterurl: 'Http://image.tmdb.org/t/p/w500' +
                              (upcoming[index]['poster_path']),
                          vote: (upcoming[index]['vote_average']).toString(),
                          launchOn: upcoming[index]['release_date'] ??
                              upcoming[index]['first_air_date']),
                    ),
                  );
                },
                child: SizedBox(
                  width: 140,
                  child: Column(children: [
                    Hero(
                      tag: upcoming[index]['id'],
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    'Http://image.tmdb.org/t/p/w500' +
                                        (upcoming[index]['poster_path'])))),
                      ),
                    ),
                    TextModifier(
                      text: upcoming[index]['title'] ?? upcoming[index]['name'],
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
