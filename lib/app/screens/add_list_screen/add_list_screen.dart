import 'package:flutter/material.dart';
import 'package:market_list/app/models/market.dart';
import 'package:market_list/app/providers/items_list_provider.dart';
import 'package:market_list/app/providers/markets_provider.dart';
import 'package:market_list/app/widgets/confirm_button_widget.dart';
import 'package:market_list/app/widgets/open_actual_list_widget.dart';
import 'package:provider/provider.dart';

import 'widget/sector_widget.dart';

class AddListScreen extends StatefulWidget {
  @override
  _AddListScreenState createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  List<String> marketsName;
  Market _selectedMarket;
  bool _isMktSelected = false;

  final _listNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Market> _markets =
        Provider.of<MarketsProvider>(context, listen: false).markets;

    final int itemsLength = Provider.of<ItemsListProvider>(context).countItems;

    void _lockMkt() {
      setState(() {
        _isMktSelected = true;
      });
      Provider.of<MarketsProvider>(context, listen: false)
          .setMarket(_selectedMarket.id);
      Provider.of<ItemsListProvider>(context, listen: false)
          .setMarket(_selectedMarket.id, _listNameController.text);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar lista'),
        actions: <Widget>[
          if (_isMktSelected) CofirmButtonWidget(itemsLength: itemsLength),
          if (_isMktSelected) OpenActualListWidget(),
        ],
      ),
      body: Container(
        child: !_isMktSelected
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      controller: _listNameController,
                      decoration: InputDecoration(
                        labelText: 'Insira o nome da lista',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: DropdownButton(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (value) {
                          setState(() {
                            _selectedMarket = value;
                          });
                        },
                        value: _selectedMarket,
                        hint: Text('Selecione o mercado'),
                        isExpanded: true,
                        items: _markets
                            .map(
                              (mkt) => DropdownMenuItem(
                                value: mkt,
                                child: Text(mkt.name),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    RaisedButton(
                      onPressed: _lockMkt,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'SELECIONAR',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  itemCount:_selectedMarket.sectors.where((sec) => sec.id != '-1').toList().length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (ctx, i) => SectorWidget(_selectedMarket.sectors.where((sec) => sec.id != '-1').toList()[i]),
                ),
              ),
      ),
    );
  }
}
