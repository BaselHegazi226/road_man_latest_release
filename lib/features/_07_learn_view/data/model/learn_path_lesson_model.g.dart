// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_path_lesson_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LearnPathLessonModelAdapter extends TypeAdapter<LearnPathLessonModel> {
  @override
  final int typeId = 2;

  @override
  LearnPathLessonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LearnPathLessonModel(
      lessonNumber: fields[0] as int,
      id: fields[1] as int,
      title: fields[2] as String,
      url: fields[3] as String,
      estimatedDuration: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LearnPathLessonModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.lessonNumber)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.estimatedDuration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LearnPathLessonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
