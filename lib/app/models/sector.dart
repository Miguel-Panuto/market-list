
import 'package:hive/hive.dart';

part 'sector.g.dart';

@HiveType(typeId: 2)
class Sector {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<Map<String, dynamic>> connections;

  Sector(
    this.id,
    this.name,
    this.connections,
  );
}
