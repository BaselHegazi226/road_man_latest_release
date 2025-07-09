import 'package:get_it/get_it.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo_implement.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/notifications/notification_cubit.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/progress_cubit/progress_cubit.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/recommended_jobs_cubit/recommended_jobs_cubit.dart';
import 'package:road_man_project/features/_08_job_view/data/repos/jobs_repo_implement.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view_model/recent_jobs/recent_jobs_cubit.dart';

class AppGet {
  static final getIt = GetIt.instance;

  static void setUp() {
    // Repos
    getIt.registerLazySingleton<HomeRepoImplement>(() => HomeRepoImplement());
    getIt.registerLazySingleton<JobsRepoImplement>(() => JobsRepoImplement());

    // Cubits
    getIt.registerLazySingleton<RecommendedJobsCubit>(
      () => RecommendedJobsCubit(getIt<HomeRepoImplement>()),
    );
    getIt.registerLazySingleton<ProgressCubit>(
      () => ProgressCubit(getIt<HomeRepoImplement>()),
    );
    getIt.registerLazySingleton<RecentJobsCubit>(
      () => RecentJobsCubit(getIt<JobsRepoImplement>()),
    );
    getIt.registerLazySingleton<NotificationCubit>(
      () => NotificationCubit(getIt<HomeRepoImplement>()),
    );
  }
}
