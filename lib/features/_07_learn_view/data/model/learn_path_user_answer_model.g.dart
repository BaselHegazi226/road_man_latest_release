// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_path_user_answer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LearnPathUserAnswerModelAdapter
    extends TypeAdapter<LearnPathUserAnswerModel> {
  @override
  final int typeId = 5;

  @override
  LearnPathUserAnswerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LearnPathUserAnswerModel(
      userAnswerId: fields[0] as String,
      questionId: fields[1] as int,
      quizId: fields[2] as int,
      answerId: fields[3] as int,
      isCorrect: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LearnPathUserAnswerModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userAnswerId)
      ..writeByte(1)
      ..write(obj.questionId)
      ..writeByte(2)
      ..write(obj.quizId)
      ..writeByte(3)
      ..write(obj.answerId)
      ..writeByte(4)
      ..write(obj.isCorrect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LearnPathUserAnswerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
