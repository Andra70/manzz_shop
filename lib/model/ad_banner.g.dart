// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_banner.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdbannerAdapter extends TypeAdapter<Adbanner> {
  @override
  final int typeId = 1;

  @override
  Adbanner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Adbanner(
      id: fields[0] as int,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Adbanner obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdbannerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
