// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemListAdapter extends TypeAdapter<ItemList> {
  @override
  final int typeId = 0;

  @override
  ItemList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemList(
      id: fields[0] as String,
      name: fields[1] as String,
      sectorId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.sectorId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
