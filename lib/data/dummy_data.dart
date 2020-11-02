import 'dart:math';

import 'package:market_list/app/models/item_list.dart';
import 'package:market_list/app/models/market.dart';
import 'package:market_list/app/models/sector.dart';


class DummyData {
  static List<Market> markets = [
    Market(
      id: 'a1',
      name: 'Enxuto',
      items: [
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Picanha',
          sectorId: 's1',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Maminha',
          sectorId: 's1',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Panceta',
          sectorId: 's1',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Requeijão',
          sectorId: 's4',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Provolone',
          sectorId: 's4',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Muçarela',
          sectorId: 's4',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Queijo branco',
          sectorId: 's4',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Vinho',
          sectorId: 's6',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Vodka',
          sectorId: 's6',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Refigerante',
          sectorId: 's7',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Suco de caixa',
          sectorId: 's7',
        ),
        ItemList(
          id: Random().nextDouble().toString(),
          name: 'Papel Higiênico',
          sectorId: 's8',
        ),
      ],
      sectors: [
        Sector(
          '-1',
          'Entrada',
          [
            {'id': 's10', 'distance': 1},
            {'id': 's8', 'distance': 2},
            {'id': 's14', 'distance': 3},
            {'id': 's7', 'distance': 4},
          ],
        ),
        Sector(
          's1',
          'Açogue',
          [
            {'id': 's2', 'distance': 1},
            {'id': 's3', 'distance': 1},
            {'id': 's12', 'distance': 1},
            {'id': 's5', 'distance': 2},
          ],
        ),
        Sector(
          's2',
          'Aves',
          [
            {'id': 's1', 'distance': 1},
            {'id': 's4', 'distance': 1},
            {'id': 's13', 'distance': 1},
            {'id': 's9', 'distance': 2},
          ],
        ),
        Sector(
          's3',
          'Frios',
          [
            {'id': 's11', 'distance': 1},
            {'id': 's5', 'distance': 1},
            {'id': 's1', 'distance': 1},
          ],
        ),
        Sector(
          's4',
          'Laticínios',
          [
            {'id': 's14', 'distance': 1},
            {'id': 's2', 'distance': 1},
          ],
        ),
        Sector(
          's5',
          'Pescados',
          [
            {'id': 's3', 'distance': 1},
            {'id': 's9', 'distance': 1},
            {'id': 's10', 'distance': 2},
            {'id': 's11', 'distance': 2},
            {'id': 's1', 'distance': 2},
          ],
        ),
        Sector(
          's6',
          'Adega',
          [
            {'id': 's7', 'distance': 1},
            {'id': 's13', 'distance': 1},
          ],
        ),
        Sector(
          's7',
          'Bebidas',
          [
            {'id': 's14', 'distance': 2},
            {'id': 's6', 'distance': 1},
          ],
        ),
        Sector(
          's8',
          'Higiene',
          [
            {'id': 's9', 'distance': 1},
            {'id': 's10', 'distance': 2},
            {'id': 's14', 'distance': 2},
          ],
        ),
        Sector(
          's9',
          'Limpeza',
          [
            {'id': 's8', 'distance': 1},
            {'id': 's5', 'distance': 1},
            {'id': 's2', 'distance': 2},
            {'id': 's10', 'distance': 2},
          ],
        ),
        Sector(
          's10',
          'Hortifruti',
          [
            {'id': 's11', 'distance': 1},
            {'id': 's5', 'distance': 2},
            {'id': 's9', 'distance': 2},
          ],
        ),
        Sector(
          's11',
          'Mercearia',
          [
            {'id': 's3', 'distance': 1},
            {'id': 's10', 'distance': 1},
            {'id': 's5', 'distance': 2},
          ],
        ),
        Sector(
          's12',
          'Padaria',
          [
            {'id': 's1', 'distance': 1},
          ],
        ),
        Sector(
          's13',
          'Confeitaria',
          [
            {'id': 's2', 'distance': 1},
            {'id': 's6', 'distance': 1},
            {'id': 's12', 'distance': 1},
          ],
        ),
        Sector(
          's14',
          'Rotisseria',
          [
            {'id': 's4', 'distance': 1},
            {'id': 's8', 'distance': 2},
            {'id': 's7', 'distance': 2},
          ],
        ),
      ],
    ),
    Market(
      id: 'a2',
      name: 'Extra',
      items: [],
      sectors: [
        Sector(
          's1',
          'Açogue',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Aves',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Frios',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Laticínios',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Pescados',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Adega',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Bebidas',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Higiene',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Limpeza',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Hortifruti',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Mercearia',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Padaria',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Confeitaria',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Rotisseria',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
      ],
    ),
    Market(
      id: 'a3',
      name: 'Savegnago',
      items: [],
      sectors: [
        Sector(
          's1',
          'Açogue',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Aves',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Frios',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Laticínios',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Pescados',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Adega',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Bebidas',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Higiene',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Limpeza',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Hortifruti',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Mercearia',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Padaria',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Confeitaria',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Rotisseria',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
      ],
    ),
    Market(
      id: 'a4',
      name: 'Carrefour',
      items: [],
      sectors: [
        Sector(
          's1',
          'Açogue',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Aves',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Frios',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Laticínios',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Pescados',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Adega',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Bebidas',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Higiene',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Limpeza',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Hortifruti',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Mercearia',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Padaria',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Confeitaria',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
        Sector(
          's2',
          'Rotisseria',
          [
            {'s2': 1, 's3': 2}
          ],
        ),
      ],
    ),
  ];
}
