// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieeAdapter extends TypeAdapter<Moviee> {
  @override
  final int typeId = 1;

  @override
  Moviee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Moviee(
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Moviee obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.isim)
      ..writeByte(3)
      ..write(obj.poster_path)
      ..writeByte(4)
      ..write(obj.overview)
      ..writeByte(5)
      ..write(obj.backdrop_path)
      ..writeByte(6)
      ..write(obj.vote_average)
      ..writeByte(7)
      ..write(obj.release_date)
      ..writeByte(8)
      ..write(obj.isfavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
