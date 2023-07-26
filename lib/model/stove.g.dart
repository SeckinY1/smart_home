// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stove.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoveAdapter extends TypeAdapter<Stove> {
  @override
  final int typeId = 1;

  @override
  Stove read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stove(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as bool,
      fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Stove obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.macAddress)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.temperature);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
