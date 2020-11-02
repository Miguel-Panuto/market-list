import 'package:flutter/foundation.dart';
import 'package:market_list/app/models/market.dart';
import 'package:market_list/app/models/market_list.dart';

class ActualListProvider with ChangeNotifier {
  MarketList _selectedList;
  Market _listMarket;

  MarketList get selectedList => _selectedList;
  Market get actualMarket => _listMarket;

  void setActualList(MarketList list, Market mkt) {
    _selectedList = list;
    _listMarket = mkt;
    notifyListeners();
  }
  
}