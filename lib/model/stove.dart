import 'package:hive/hive.dart';

part 'stove.g.dart';

@HiveType(typeId: 1)
class Stove extends HiveObject {
  @HiveField(0)
  final String macAddress;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String model;

  @HiveField(3)
  bool status;

  @HiveField(4)
  double temperature;

  Stove(this.macAddress, this.name, this.model, this.status, this.temperature);
}
