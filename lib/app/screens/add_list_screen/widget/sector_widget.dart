import 'package:flutter/material.dart';
import 'package:market_list/app/models/sector.dart';
import 'package:market_list/app/utils/app_routes.dart';

class SectorWidget extends StatelessWidget {
  final Sector sector;

  const SectorWidget(this.sector);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.ITEMS, arguments: sector);
          },
          child: Center(
            child: Text(
              sector.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
