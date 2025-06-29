// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_path_question_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LearningPathQuestionModelAdapter
    extends TypeAdapter<LearningPathQuestionModel> {
  @override
  final int typeId = 6;

  @override
  LearningPathQuestionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LearningPathQuestionModel(
      id: fields[0] as int,
      text: fields[1] as String,
      answers: (fields[2] as List).cast<LearnPathAnswerModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, LearningPathQuestionModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LearningPathQuestionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
