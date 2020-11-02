
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'item_list.g.dart';

@HiveType(typeId: 0)
class ItemList {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String sectorId;

  const ItemList({
    @required this.id,
    @required this.name,
    @required this.sectorId,
  });
}

