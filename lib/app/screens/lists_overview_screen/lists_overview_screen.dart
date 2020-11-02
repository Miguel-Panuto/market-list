import 'package:flutter/material.dart';
import 'package:market_list/app/models/market.dart';
import 'package:market_list/app/providers/actual_list_provider.dart';
import 'package:market_list/app/providers/items_list_provider.dart';
import 'package:market_list/app/providers/markets_provider.dart';
import 'package:market_list/app/utils/app_routes.dart';
import 'package:market_list/app/widgets/dialog_bool_widget.dart';
import 'package:provider/provider.dart';

class ListsOverviewScreen extends StatefulWidget {
  @override
  _ListsOverviewScreenState createState() => _ListsOverviewScreenState();
}

class _ListsOverviewScreenState extends State<ListsOverviewScreen> {
  ItemsListProvider itemsProvider;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    Provider.of<ItemsListProvider>(context, listen: false)
        .initLists()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ItemsListProvider itemsProvider = Provider.of(context);
    final items = itemsProvider.lists;
    List<Market> _markets =
        Provider.of<MarketsProvider>(context, listen: false).markets;
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.ADD_LIST),
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : itemsProvider.countLists <= 0
              ? Center(
                  child: Text('Nenhuma lista encontrada'),
                )
              : ListView.builder(
                  itemCount: itemsProvider.countLists,
                  itemBuilder: (ctx, i) {
                    Market mkt = _markets
                        .firstWhere((mkt) => mkt.id == items[i].marketId);
                    return ListTile(
                      title: Text(items[i].name),
                      onTap: () {
                        Provider.of<ActualListProvider>(context, listen: false)
                            .setActualList(items[i], mkt);
                        Navigator.of(context).pushNamed(AppRoutes.LIST);
                      },
                      leading: CircleAvatar(
                        child: Text(mkt.name[0]),
                      ),
                      trailing: DialogBoolWidget(
                        title: 'Deletar',
                        subtitle: 'Deseja mesmo deletar?',
                        iconBtn: Icon(Icons.delete),
                        onSubmit: () {
                          itemsProvider.removeList(items[i].id);
                        },
                        color: Theme.of(context).errorColor,
                      ),
                    );
                  },
                ),
    );
  }
}
