import 'package:flutter/material.dart';
import 'package:moviesandmoviez/helper/datahelper.dart';
import 'package:moviesandmoviez/main.dart';

class DetailsPage extends StatelessWidget {
  final String name, description, bannerurl, posterurl, launchOn;
  final String vote;

  final int id;
  const DetailsPage(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchOn,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addedfavorite;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(children: [
              Positioned(
                child: Hero(
                  tag: id,
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(
                          bannerurl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: TextModifier(
                    text: '⭐  Avarage Vote - $vote',
                    size: 20,
                    color: Colors.white,
                    con: false),
              ),
            ]),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextModifier(
                      text: name, size: 24, color: Colors.white, con: false),
                ),
              ),
              IconButton(
                onPressed: (() {}),
                icon: const Icon(Icons.favorite),
                color: Colors.red,
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextModifier(
                text: 'Releasing on : $launchOn',
                size: 20,
                color: Colors.white,
                con: false),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: TextModifier(
                text: description, size: 16, color: Colors.white, con: false),
          )
        ],
      ),
    );
  }
}
