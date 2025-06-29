// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_path_answer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LearnPathAnswerModelAdapter extends TypeAdapter<LearnPathAnswerModel> {
  @override
  final int typeId = 1;

  @override
  LearnPathAnswerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LearnPathAnswerModel(
      id: fields[0] as int,
      text: fields[1] as String?,
      isCorrect: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LearnPathAnswerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isCorrect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LearnPathAnswerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
