import 'package:flutter/material.dart';

class DialogBoolWidget extends StatelessWidget {

  final void Function() onSubmit;
  final Icon iconBtn;
  final String title;
  final String subtitle;
  final Color color;

  DialogBoolWidget({
    @required this.onSubmit,
    @required this.iconBtn,
    @required this.title,
    @required this.subtitle,
    this.color = Colors.white,
  });

  Future<dynamic> _dialogBool(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
            child: Text(
              'Não',
              style: TextStyle(color: Theme.of(context).errorColor),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop(true);
            },
            child: Text(
              'Sim',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: iconBtn,
      onPressed: () async {
        final isAccepted = await _dialogBool(context);
        if(isAccepted == null || !isAccepted) return;
        return onSubmit();
      },
      color: color,
    );
  }
}
