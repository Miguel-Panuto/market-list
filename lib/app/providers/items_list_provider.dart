import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:market_list/app/models/item_list.dart';
import 'package:market_list/app/models/market_list.dart';
import 'package:market_list/app/models/sector.dart';
import 'package:market_list/app/utils/db_utils.dart';
import 'package:market_list/data/uniform_cost.dart';

class ItemsListProvider with ChangeNotifier {
  List<MarketList> _lists = [];
  List<MarketList> get lists => [..._lists];
  int get countLists => _lists.length;

  static const String boxName = 'lists';

  Future<void> initLists() async {
    try {
      _lists = await DbUtil.index(boxName);
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return Future.value();
  }

  MarketList pickList(String id) {
    return _lists.firstWhere((list) => list.id == id);
  }

  String _marketId;
  String _listName;

  void setMarket(String marketId, String listName) {
    _marketId = marketId;
    _listName = listName;
  }

  List<ItemList> _items = [];
  List<ItemList> get items => [..._items];
  int get countItems => _items.length;

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void addList(List<Sector> sectors) async {
    if (_items.isEmpty) return;
    final uc = UniformCost(items: _items, sectors: sectors);
    final pattern = uc.initSearch();
    final List<ItemList> items = [];
    pattern.forEach((sectorId) {
      print(sectorId);
      items.addAll(_items.where((item) => item.sectorId == sectorId));
    });

    final newList = MarketList(
      id: Random().nextDouble().toString(),
      name: _listName,
      items: items,
      marketId: _marketId,
    );
    _lists.add(newList);
    notifyListeners();
    _items = [];
    await DbUtil.insertOrEdit(boxName, newList.id, newList);
  }

  void addItem(ItemList item) {
    _items.add(item);
    notifyListeners();
  }

  void removeList(String id) async {
    await DbUtil.delete(boxName, id);
    _lists.removeWhere((list) => list.id == id);
    notifyListeners();
  }
}
