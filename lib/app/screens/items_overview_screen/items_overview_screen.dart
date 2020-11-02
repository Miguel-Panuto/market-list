import 'package:flutter/material.dart';
import 'package:market_list/app/models/item_list.dart';
import 'package:market_list/app/models/sector.dart';
import 'package:market_list/app/providers/items_list_provider.dart';
import 'package:market_list/app/providers/markets_provider.dart';
import 'package:market_list/app/widgets/confirm_button_widget.dart';
import 'package:market_list/app/widgets/open_actual_list_widget.dart';
import 'package:provider/provider.dart';

import 'widgets/item_grid.dart';

class ItemsOverviewScreen extends StatefulWidget {
  @override
  _ItemsOverviewScreenState createState() => _ItemsOverviewScreenState();
}

class _ItemsOverviewScreenState extends State<ItemsOverviewScreen> {
  List<ItemList> _items;
  Sector sector;
  bool _isLoading = true;

  void _initPage(Sector sector) {
    _items = Provider.of<MarketsProvider>(context)
        .selectedMarket
        .items
        .where((mkt) => mkt.sectorId == sector.id)
        .toList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    sector = ModalRoute.of(context).settings.arguments as Sector;
    _initPage(sector);
    final itemsLength = Provider.of<ItemsListProvider>(context).countItems;

    return Scaffold(
      appBar: AppBar(
        title: _isLoading ? null : Text(sector.name),
        actions: <Widget>[
          CofirmButtonWidget(itemsLength: itemsLength),
          OpenActualListWidget(),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _items.isEmpty
              ? Center(
                  child: Text('Nenhum item no setor'),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: _items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (ctx, i) => ItemGrid(_items[i]),
                ),
    );
  }
}
