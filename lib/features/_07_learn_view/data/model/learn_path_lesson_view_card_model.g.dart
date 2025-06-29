// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_path_lesson_view_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LearnPathLessonViewCardModelAdapter
    extends TypeAdapter<LearnPathLessonViewCardModel> {
  @override
  final int typeId = 6;

  @override
  LearnPathLessonViewCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LearnPathLessonViewCardModel(
      lessonNumber: fields[0] as String,
      title: fields[1] as String,
      estimatedDuration: fields[2] as String,
      isAvailable: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LearnPathLessonViewCardModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.lessonNumber)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.estimatedDuration)
      ..writeByte(3)
      ..write(obj.isAvailable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LearnPathLessonViewCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
