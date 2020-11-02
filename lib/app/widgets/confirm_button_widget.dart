import 'package:flutter/material.dart';
import 'package:market_list/app/providers/items_list_provider.dart';
import 'package:market_list/app/providers/markets_provider.dart';
import 'package:market_list/app/utils/app_routes.dart';
import 'package:provider/provider.dart';

import 'dialog_bool_widget.dart';

class CofirmButtonWidget extends StatelessWidget {
  final int itemsLength;

  const CofirmButtonWidget({
    @required this.itemsLength,
  });

  @override
  Widget build(BuildContext context) {
    return DialogBoolWidget(
      title: 'Criar lista',
      subtitle: 'Deseja mesmo criar essa lista?',
      iconBtn: Icon(Icons.done),
      onSubmit: itemsLength > 0
          ? () {
              Provider.of<ItemsListProvider>(context, listen: false).addList(
                Provider.of<MarketsProvider>(context, listen: false)
                    .selectedMarket
                    .sectors,
              );
              return Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.HOME, (route) => false);
            }
          : null,
    );
  }
}
