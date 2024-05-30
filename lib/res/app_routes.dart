// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const BASE = _Paths.BASE;
  static const PROFILE = _Paths.PROFILE;
  static const HOME = _Paths.HOME;
  static const SETTING = _Paths.SETTING;
}

abstract class _Paths {
  _Paths._();
  static const BASE = '/base';
  static const PROFILE = '/profile';
  static const HOME = '/home';
  static const SETTING = '/setting';
}
