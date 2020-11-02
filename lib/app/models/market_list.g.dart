// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarketListAdapter extends TypeAdapter<MarketList> {
  @override
  final int typeId = 1;

  @override
  MarketList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MarketList(
      id: fields[0] as String,
      name: fields[1] as String,
      items: (fields[3] as List)?.cast<ItemList>(),
      marketId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MarketList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.marketId)
      ..writeByte(3)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarketListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
