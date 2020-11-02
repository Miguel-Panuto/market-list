import 'package:flutter/foundation.dart';
import 'package:market_list/app/models/item_list.dart';
import 'package:market_list/app/models/sector.dart';

class UniformCost {
  final List<Sector> sectors;
  final List<ItemList> items;

  List<String> _nodesToGo;

  void setNodesToGo() {
    List<Sector> extractedSectors = items.map((item) {
      return sectors.firstWhere((sector) => sector.id == item.sectorId);
    }).toList();
    List<Sector> nodesToGo = [];
    extractedSectors.forEach((sector) {
      if (nodesToGo.length <= 0 || !nodesToGo.contains(sector)) {
        return nodesToGo.add(sector);
      }
    });
    _nodesToGo = nodesToGo.map((node) => node.id).toList();
  }

  UniformCost({@required this.sectors, @required this.items});

  List<String> initSearch() {
    setNodesToGo();
    final connections = findConections('-1', Path([], 0));
    return _uniformCost(connections);
  }

  List<String> _uniformCost(List<Path> paths) {
    int minor = paths.first.distance;
    Path bestPath;
    paths.forEach((path) {
      if (path.distance <= minor) {
        minor = path.distance;
        bestPath = path;
      }
    });
    if (isCompleted(bestPath)) return bestPath.ids;
    final newPaths = findConections(bestPath.ids.last, bestPath);
    paths.remove(bestPath);
    paths.addAll(newPaths);
    return _uniformCost(paths);
  }

  List<Path> findConections(String id, Path path) {
    final List<Path> paths = [];
    final connections = sectors.firstWhere((sec) => sec.id == id).connections;
    connections.forEach((point) {
      if (path.ids.length <= 0 || !path.ids.contains(point['id'])) {
        paths.add(
          Path(
            [...path.ids, point['id']],
            (path.distance + point['distance']),
          ),
        );
      }
    });
    return paths;
  }

  bool isCompleted(Path path) {
    final nodesToGo = [..._nodesToGo];

    path.ids.forEach((id) {
      if(nodesToGo.contains(id)) {
        nodesToGo.remove(id);
      }
    });

    if (nodesToGo.length <= 0) {
      return true;
    }
    return false;
  }
}

class Path {
  final List<String> ids;
  final int distance;

  const Path(this.ids, this.distance);
}
