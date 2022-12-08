// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:moviesandmoviez/favoriler.dart';
import 'package:moviesandmoviez/helper/datahelper.dart';
import 'package:moviesandmoviez/widgets/coming.dart';
import 'package:moviesandmoviez/widgets/toprated.dart';
import 'package:moviesandmoviez/widgets/trending.dart';
import 'package:moviesandmoviez/widgets/tvshows.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tvshows = [];
  List upcoming = [];
  List favorites = [];

  final String apikey = 'f7edeec72fc02f136fee6ab050961635';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmN2VkZWVjNzJmYzAyZjEzNmZlZTZhYjA1MDk2MTYzNSIsInN1YiI6IjYzODg3NjgxZDM4OGFlMDBhZjRkODU2NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ngTiItCqB1q0GJ0N8tdQEDqp9FVkz_fohxVObM1Clzk';
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvshowsresults = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upcomingresults = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    setState(() {
      trendingmovies = trendingresults['results'];
      topratedmovies = topratedresults['results'];
      tvshows = tvshowsresults['results'];
      upcoming = upcomingresults['results'];
    });
  }

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
                  builder: (context) => Favorites(favorites: trendingmovies),
                ),
              );
            }),
            icon: const Icon(Icons.favorite),
            color: Colors.red,
          )
        ],
        title: const TextModifier(
          text: 'Movies And Moviez ❤️',
          size: 22,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: [
        UpComingMovies(
          upcoming: upcoming,
        ),
        TrendingMovies(trending: trendingmovies),
        TopratedMovies(
          toprated: topratedmovies,
        ),
        TvShows(tvshows: tvshows),
      ]),
    );
  }
}
