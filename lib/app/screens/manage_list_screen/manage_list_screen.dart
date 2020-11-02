import 'package:flutter/material.dart';
import 'package:market_list/app/providers/items_list_provider.dart';
import 'package:market_list/app/widgets/confirm_button_widget.dart';
import 'package:market_list/app/widgets/dialog_bool_widget.dart';
import 'package:provider/provider.dart';

class ManageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _itemsProvider = Provider.of<ItemsListProvider>(context);
    final _items = _itemsProvider.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista atual'),
        actions: <Widget>[
          CofirmButtonWidget(itemsLength: _itemsProvider.countItems),
        ],
      ),
      body: _items.length > 0
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (ctx, i) => Card(
                  margin: EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    title: Text(
                      _items[i].name,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: DialogBoolWidget(
                      title: 'Deletar',
                      subtitle: 'Deseja mesmo deletar esse item?',
                      iconBtn: Icon(Icons.delete),
                      onSubmit: () {
                        _itemsProvider.removeItem(_items[i].id);
                      },
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: Text('Nenhum item adicionado'),
            ),
    );
  }
}
