// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_path_quiz_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LearnPathQuizModelAdapter extends TypeAdapter<LearnPathQuizModel> {
  @override
  final int typeId = 4;

  @override
  LearnPathQuizModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LearnPathQuizModel(
      id: fields[0] as int,
      title: fields[1] as String,
      createdAt: fields[2] as DateTime,
      isCompleted: fields[3] as bool,
      questions: (fields[4] as List).cast<LearningPathQuestionModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, LearnPathQuizModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.questions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LearnPathQuizModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
