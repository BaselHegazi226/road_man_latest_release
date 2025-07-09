import 'package:get_it/get_it.dart';
import 'package:road_man_project/features/_06_home_view/data/repos/home_repo_implement.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/progress_cubit/progress_cubit.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view_model/recommended_jobs_cubit/recommended_jobs_cubit.dart';

class AppGet {
  static final getIt = GetIt.instance;

  static void setUp() {
    // Repos
    getIt.registerLazySingleton<HomeRepoImplement>(() => HomeRepoImplement());
    getIt.registerLazySingleton<HomeRepoImplement>(() => HomeRepoImplement());

    // Cubits
    getIt.registerLazySingleton<RecommendedJobsCubit>(
      () => RecommendedJobsCubit(getIt<HomeRepoImplement>()),
    );
    getIt.registerLazySingleton<ProgressCubit>(
      () => ProgressCubit(getIt<HomeRepoImplement>()),
    );
  }
}
