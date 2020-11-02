import 'package:flutter/cupertino.dart';
import 'package:market_list/app/models/market.dart';
import 'package:market_list/data/dummy_data.dart';

class MarketsProvider with ChangeNotifier {
  List<Market> _markets = DummyData.markets;
  List<Market> get markets => [..._markets];

  Market _selectedMarket;
  Market get selectedMarket => _selectedMarket;

  void setMarket(String id) {
    _selectedMarket = _markets.firstWhere((mkt) => mkt.id == id);
    notifyListeners();
  }

  int get count => _markets.length;
}