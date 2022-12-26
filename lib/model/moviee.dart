// ignore_for_file: non_constant_identifier_names
import 'package:hive_flutter/hive_flutter.dart';
part 'moviee.g.dart';

@HiveType(typeId: 1)
class Moviee {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String isim;
  @HiveField(3)
  final String poster_path;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final String backdrop_path;
  @HiveField(6)
  final String vote_average;
  @HiveField(7)
  final String release_date;
  @HiveField(8)
  int isfavorite;

  Moviee(
      this.id,
      this.isim,
      this.poster_path,
      this.overview,
      this.backdrop_path,
      this.vote_average,
      this.release_date,
      this.isfavorite);
}
