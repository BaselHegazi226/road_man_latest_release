part of 'recommended_jobs_cubit.dart';

@immutable
sealed class RecommendedJobsState {}

// الحالة الأولية قبل بدء أي عملية
final class RecommendedJobsInitial extends RecommendedJobsState {}

// حالة جاري التحميل، تُستخدم لعرض مؤشر التحميل (loading indicator)
final class RecommendedJobsLoading extends RecommendedJobsState {}

// حالة النجاح، وتحمل معها قائمة الوظائف التي تم جلبها
final class RecommendedJobsSuccess extends RecommendedJobsState {
  final List<JobModel> jobs;
  RecommendedJobsSuccess(this.jobs);
}

// حالة الفشل، وتحمل معها رسالة الخطأ لعرضها للمستخدم
final class RecommendedJobsFailure extends RecommendedJobsState {
  final String errorMessage;
  RecommendedJobsFailure(this.errorMessage);
}