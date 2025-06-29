// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_path_quiz_view_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizViewCardAnswerAdapter extends TypeAdapter<QuizViewCardAnswer> {
  @override
  final int typeId = 8;

  @override
  QuizViewCardAnswer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizViewCardAnswer(
      answerId: fields[0] as int,
      answerText: fields[1] as String,
      isCorrect: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, QuizViewCardAnswer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.answerId)
      ..writeByte(1)
      ..write(obj.answerText)
      ..writeByte(2)
      ..write(obj.isCorrect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizViewCardAnswerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
