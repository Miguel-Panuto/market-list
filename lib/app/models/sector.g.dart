// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SectorAdapter extends TypeAdapter<Sector> {
  @override
  final int typeId = 2;

  @override
  Sector read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sector(
      fields[0] as String,
      fields[1] as String,
      (fields[2] as List)
          ?.map((dynamic e) => (e as Map)?.cast<String, int>())
          ?.toList(),
    );
  }

  @override
  void write(BinaryWriter writer, Sector obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.connections);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
