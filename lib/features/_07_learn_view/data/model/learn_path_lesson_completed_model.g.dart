// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_path_lesson_completed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LearnPathLessonCompletedModelAdapter
    extends TypeAdapter<LearnPathLessonCompletedModel> {
  @override
  final int typeId = 9;

  @override
  LearnPathLessonCompletedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LearnPathLessonCompletedModel(
      isCompleted: fields[0] as bool?,
      lessonId: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LearnPathLessonCompletedModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isCompleted)
      ..writeByte(1)
      ..write(obj.lessonId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LearnPathLessonCompletedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
