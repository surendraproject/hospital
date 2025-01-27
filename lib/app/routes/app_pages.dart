import 'package:get/get.dart';
import '../modules/about_us/bindings/about_us_binding.dart';
import '../modules/about_us/views/about_us_view.dart';
import '../modules/appointment/bindings/appointment_binding.dart';
import '../modules/appointment/views/appointment_view.dart';
import '../modules/appointment_history/bindings/appointment_history_binding.dart';
import '../modules/appointment_history/views/appointment_history_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/doctor_list/bindings/doctor_list_binding.dart';
import '../modules/doctor_list/views/doctor_list_view.dart';
import '../modules/help_center/bindings/help_center_binding.dart';
import '../modules/help_center/views/help_center_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifaction/bindings/notifaction_binding.dart';
import '../modules/notifaction/views/notifaction_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/report_history/bindings/report_history_binding.dart';
import '../modules/report_history/views/report_history_view.dart';
import '../modules/review/bindings/review_binding.dart';
import '../modules/review/views/review_view.dart';
import '../modules/side_bar/bindings/side_bar_binding.dart';
import '../modules/side_bar/views/side_bar_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/terms_condition/bindings/terms_condition_binding.dart';
import '../modules/terms_condition/views/terms_condition_view.dart';
import '../modules/upcoming_appointment/bindings/upcoming_appointment_binding.dart';
import '../modules/upcoming_appointment/views/upcoming_appointment_view.dart';
import '../modules/update_profile/bindings/update_profile_binding.dart';
import '../modules/update_profile/views/update_profile_view.dart';
import '../modules/upload_report/bindings/upload_report_binding.dart';
import '../modules/upload_report/views/upload_report_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_LIST,
      page: () => const DoctorListView(),
      binding: DoctorListBinding(),
    ),
    GetPage(
      name: _Paths.SIDE_BAR,
      page: () => const SideBarView(),
      binding: SideBarBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFACTION,
      page: () => const NotifactionView(),
      binding: NotifactionBinding(),
    ),
    GetPage(
      name: _Paths.UPCOMING_APPOINTMENT,
      page: () => const UpcomingAppointmentView(),
      binding: UpcomingAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENT_HISTORY,
      page: () => const AppointmentHistoryView(),
      binding: AppointmentHistoryBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_HISTORY,
      page: () => const ReportHistoryView(),
      binding: ReportHistoryBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_REPORT,
      page: () => const UploadReportView(),
      binding: UploadReportBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW,
      page: () => const ReviewView(),
      binding: ReviewBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITION,
      page: () => const TermsConditionView(),
      binding: TermsConditionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => const UpdateProfileView(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENT,
      page: () => const AppointmentView(),
      binding: AppointmentBinding(),
    ),
    GetPage(
      name: _Paths.HELP_CENTER,
      page: () => const HelpCenterView(),
      binding: HelpCenterBinding(),
    ),
  ];
   
}
