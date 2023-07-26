// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lamp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LampAdapter extends TypeAdapter<Lamp> {
  @override
  final int typeId = 0;

  @override
  Lamp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lamp(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Lamp obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.macAddress)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LampAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
