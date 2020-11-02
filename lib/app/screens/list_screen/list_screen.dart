import 'package:flutter/material.dart';
import 'package:market_list/app/models/market_list.dart';
import 'package:market_list/app/providers/actual_list_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/list_tile_with_check_box.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  
  @override
  Widget build(BuildContext context) {
    final MarketList list = Provider.of<ActualListProvider>(context).selectedList;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(list.name),
      ),
      body: ListView.builder(
        itemCount: list.items.length,
        itemBuilder: (ctx, i) => ListTileWithCheckBox(list.items[i]),
      ),
    );
  }
}
