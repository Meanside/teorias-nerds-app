import 'package:get/get.dart';
import 'package:theory_project/routes/app_routes.dart';
import 'package:theory_project/views/onboarding_view.dart';
import 'package:theory_project/views/home_view.dart';
import 'package:theory_project/views/add_theory_view.dart';
import 'package:theory_project/views/theory_detail_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.ADD_THEORY,
      page: () => const AddTheoryView(),
    ),
    GetPage(
      name: Routes.THEORY_DETAIL,
      page: () => const TheoryDetailView(),
    ),
  ];
}
