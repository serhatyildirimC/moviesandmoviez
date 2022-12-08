// ignore_for_file: prefer_interpolation_to_compose_strings, duplicate_ignore, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:moviesandmoviez/details.dart';
import 'package:moviesandmoviez/helper/datahelper.dart';

class TvShows extends StatelessWidget {
  final List tvshows;
  const TvShows({Key? key, required this.tvshows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TextModifier(
          text: 'Tv Shows ',
          size: 26,
          color: Colors.white,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tvshows.length,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                          id: (tvshows[index]['id'] * 1000),
                          name: tvshows[index]['name'],
                          description: tvshows[index]['overview'],
                          bannerurl: 'Http://image.tmdb.org/t/p/w500' +
                              (tvshows[index]['backdrop_path']),
                          posterurl: 'Http://image.tmdb.org/t/p/w500' +
                              (tvshows[index]['poster_path']),
                          vote: (tvshows[index]['vote_average'].toString()),
                          launchOn: tvshows[index]['first_air_date']),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 250,
                  child: Column(children: [
                    Hero(
                      tag: (tvshows[index]['id'] * 1000),
                      child: Container(
                        height: 140,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                // ignore: prefer_interpolation_to_compose_strings
                                'Http://image.tmdb.org/t/p/w500' +
                                    (tvshows[index]['backdrop_path'] ??
                                        tvshows[index]['poster_path']),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Container(
                      child: TextModifier(
                        text: tvshows[index]['name'] ?? 'N/A',
                        size: 16,
                        color: Colors.white,
                      ),
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
