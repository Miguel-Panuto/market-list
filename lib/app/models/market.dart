import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'item_list.dart';
import 'sector.dart';

class Market {
  final String id;
  final String name;
  final List<Sector> sectors;
  final List<ItemList> items;

  Market({
    @required this.id,
    @required this.name,
    @required this.sectors,
    @required this.items,
  });
}
