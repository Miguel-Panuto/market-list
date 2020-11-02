import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'item_list.dart';

part 'market_list.g.dart';

@HiveType(typeId: 1)
class MarketList {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String marketId;
  @HiveField(3)
  final List<ItemList> items;

  const MarketList({
    @required this.id,
    @required this.name,
    @required this.items,
    @required this.marketId,
  });
}