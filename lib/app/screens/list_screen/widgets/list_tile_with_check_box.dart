import 'package:flutter/material.dart';
import 'package:market_list/app/models/item_list.dart';

class ListTileWithCheckBox extends StatefulWidget {
  final ItemList item;
  ListTileWithCheckBox(this.item);
  @override
  _ListTileWithCheckBoxState createState() => _ListTileWithCheckBoxState();
}

class _ListTileWithCheckBoxState extends State<ListTileWithCheckBox> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: _isSelected,
        onChanged: (value) {
          setState(() {
            _isSelected = value;
          });
        },
      ),
      title: Text(widget.item.name),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {},
        color: Theme.of(context).errorColor,
      ),
    );
  }
}
