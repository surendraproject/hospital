part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const REGISTER = _Paths.REGISTER;
  static const LOGIN = _Paths.LOGIN;
  static const DOCTOR_LIST = _Paths.DOCTOR_LIST;
  static const SIDE_BAR = _Paths.SIDE_BAR;
  static const NOTIFACTION = _Paths.NOTIFACTION;
  static const UPCOMING_APPOINTMENT = _Paths.UPCOMING_APPOINTMENT;
  static const APPOINTMENT_HISTORY = _Paths.APPOINTMENT_HISTORY;
  static const REPORT_HISTORY = _Paths.REPORT_HISTORY;
  static const ABOUT_US = _Paths.ABOUT_US;
  static const UPLOAD_REPORT = _Paths.UPLOAD_REPORT;
  static const CONTACT_US = _Paths.CONTACT_US;
  static const REVIEW = _Paths.REVIEW;
  static const PRIVACY_POLICY = _Paths.PRIVACY_POLICY;
  static const TERMS_CONDITION = _Paths.TERMS_CONDITION;
  static const PROFILE = _Paths.PROFILE;
  static const UPDATE_PROFILE = _Paths.UPDATE_PROFILE;
  static const CATEGORY = _Paths.CATEGORY;
  static const APPOINTMENT = _Paths.APPOINTMENT;
  static const HELP_CENTER = _Paths.HELP_CENTER;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const REGISTER = '/register';
  static const LOGIN = '/login';
  static const DOCTOR_LIST = '/doctor-list';
  static const SIDE_BAR = '/side-bar';
  static const NOTIFACTION = '/notifaction';
  static const UPCOMING_APPOINTMENT = '/upcoming-appointment';
  static const APPOINTMENT_HISTORY = '/appointment-history';
  static const REPORT_HISTORY = '/report-history';
  static const ABOUT_US = '/about-us';
  static const UPLOAD_REPORT = '/upload-report';
  static const CONTACT_US = '/contact-us';
  static const REVIEW = '/review';
  static const PRIVACY_POLICY = '/privacy-policy';
  static const TERMS_CONDITION = '/terms-condition';
  static const PROFILE = '/profile';
  static const UPDATE_PROFILE = '/update-profile';
  static const CATEGORY = '/category';
  static const APPOINTMENT = '/appointment';
  static const HELP_CENTER = '/help-center';
}
