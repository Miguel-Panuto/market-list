import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/actual_list_provider.dart';
import 'providers/items_list_provider.dart';
import 'providers/markets_provider.dart';
import 'screens/add_list_screen/add_list_screen.dart';
import 'screens/items_overview_screen/items_overview_screen.dart';
import 'screens/list_screen/list_screen.dart';
import 'screens/lists_overview_screen/lists_overview_screen.dart';
import 'screens/manage_list_screen/manage_list_screen.dart';
import 'utils/app_routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MarketsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ItemsListProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ActualListProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Market List',
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Color(0xFFFA4224),
          accentColor: Color(0xFFFDDC5C),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
          highlightColor: Color(0x55FDDC5C),
          splashColor: Color(0xAAFDDC5C),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ),
        routes: {
          AppRoutes.HOME: (ctx) => ListsOverviewScreen(),
          AppRoutes.ADD_LIST: (ctx) => AddListScreen(),
          AppRoutes.ITEMS: (ctx) => ItemsOverviewScreen(),
          AppRoutes.MANAGE_LIST: (ctx) => ManageListScreen(),
          AppRoutes.LIST: (ctx) => ListScreen(),
        },
      ),
    );
  }
}
