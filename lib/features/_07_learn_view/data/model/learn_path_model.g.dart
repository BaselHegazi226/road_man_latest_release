// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_path_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LearnPathModelAdapter extends TypeAdapter<LearnPathModel> {
  @override
  final int typeId = 3;

  @override
  LearnPathModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LearnPathModel(
      levelNumber: fields[0] as int,
      id: fields[1] as int,
      progressStatus: fields[2] as int,
      trackResourceId: fields[3] as int,
      url: fields[4] as String,
      title: fields[5] as String,
      level: fields[6] as String,
      language: fields[7] as String,
      typeOfContent: fields[8] as String,
      estimatedDuration: fields[9] as int,
      lessons: (fields[10] as List).cast<LearnPathLessonModel>(),
      quiz: fields[11] as LearnPathQuizModel,
    );
  }

  @override
  void write(BinaryWriter writer, LearnPathModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.levelNumber)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.progressStatus)
      ..writeByte(3)
      ..write(obj.trackResourceId)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.level)
      ..writeByte(7)
      ..write(obj.language)
      ..writeByte(8)
      ..write(obj.typeOfContent)
      ..writeByte(9)
      ..write(obj.estimatedDuration)
      ..writeByte(10)
      ..write(obj.lessons)
      ..writeByte(11)
      ..write(obj.quiz);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LearnPathModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
