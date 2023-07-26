import 'package:hive/hive.dart';

part 'lamp.g.dart';

@HiveType(typeId: 0)
class Lamp extends HiveObject {
  @HiveField(0)
  late String macAddress;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String model;

  @HiveField(3)
  late bool status;

  Lamp(this.macAddress, this.name, this.model, this.status);
}
