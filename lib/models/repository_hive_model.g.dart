// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepositroyHiveAdapter extends TypeAdapter<RepositroyHive> {
  @override
  final int typeId = 1;

  @override
  RepositroyHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepositroyHive(
      title: fields[0] as String?,
      description: fields[1] as String?,
      imageUrl: fields[2] as String?,
      user: fields[3] as String?,
      starCount: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RepositroyHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.user)
      ..writeByte(4)
      ..write(obj.starCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositroyHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
