import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:market_list/app/models/item_list.dart';
import 'package:market_list/app/models/market_list.dart';
import 'package:market_list/app/models/sector.dart';

class DbUtil {
  static bool _isStarted = false;

  static Future<Box> database(String boxName) async {
    if (!_isStarted) {
      await Hive.initFlutter();
      Hive.registerAdapter(SectorAdapter());
      Hive.registerAdapter(ItemListAdapter());
      Hive.registerAdapter(MarketListAdapter());
      _isStarted = true;
    }
    final box = await Hive.openBox(boxName);
    return box;
  }

  static Future<void> insertOrEdit(
      String boxName, String id, MarketList marketList) async {
    final box = await database(boxName);
    await box.put(id, marketList);
  }

  static Future<MarketList> show(String boxName, String id) async {
    final box = await database(boxName);
    final marketList = await box.get(id);
    if (marketList == null) return null;
    return marketList;
  }

  static Future<List<MarketList>> index(String boxName) async {
    final box = await database(boxName);
    final boxCount = box.length;
    final List<MarketList> list = [];
    if (boxCount > 0)
      for (int i = 0; i < boxCount; i++) {
        list.add(await box.getAt(i));
      }
    return list;
  }

  static Future<void> delete(String boxName, String id) async {
    final box = await database(boxName);
    await box.delete(id);
    return Future.value();
  }

  static Future<void> deleteAll(String boxName) async {
    final box = await database(boxName);
    await box.deleteFromDisk();
  }
}
