part of 'progress_cubit.dart';

@immutable
sealed class ProgressState {}

// الحالة الأولية قبل بدء أي عملية
final class ProgressInitial extends ProgressState {}

// حالة جاري التحميل، تُستخدم لعرض مؤشر التحميل (loading indicator)
final class ProgressLoading extends ProgressState {}

// حالة النجاح، وتحمل معها قائمة الوظائف التي تم جلبها
final class ProgressSuccess extends ProgressState {
  final ProgressModel progress;
  ProgressSuccess(this.progress);
}

// حالة الفشل، وتحمل معها رسالة الخطأ لعرضها للمستخدم
final class ProgressFailure extends ProgressState {
  final String errorMessage;
  ProgressFailure(this.errorMessage);
}