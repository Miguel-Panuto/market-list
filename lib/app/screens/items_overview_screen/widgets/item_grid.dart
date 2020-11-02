import 'package:flutter/material.dart';
import 'package:market_list/app/models/item_list.dart';
import 'package:market_list/app/providers/items_list_provider.dart';
import 'package:provider/provider.dart';

class ItemGrid extends StatelessWidget {
  final ItemList item;
  ItemGrid(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        child: Center(
          child: Text(
            item.name,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        footer: Container(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<ItemsListProvider>(context, listen: false).addItem(item);
            },
          ),
        ),
      ),
    );
  }
}
