import 'package:flutter/cupertino.dart';

class AppColors {
  static Color? _color;

  static const PRIMARY = Color(0xFF0B5394);
  static const SECONDARY = Color(0xFF008676);

  static const SUCCESS = Color(0xFF22C55E);
  static const WARNING = Color(0xFFFACC15);
  static const ERROR = Color(0xFFFF4747);

  AppColors._(Color color) {
    _color = color;
  }

  static AppColors primary() {
    return AppColors._(PRIMARY);
  }

  static AppColors secondary() {
    return AppColors._(SECONDARY);
  }

  static AppColors greyScale50() {
    return AppColors._(const Color(0xFFFAFAFA));
  }

  static AppColors greyScale97() {
    return AppColors._(const Color(0xFFF7F7F7));
  }

  static AppColors greyScale100() {
    return AppColors._(const Color(0xFFF7FAFC));
  }

  static AppColors greyScale200() {
    return AppColors._(const Color(0xFFEDF2F7));
  }

  static AppColors greyScale300() {
    return AppColors._(const Color(0xFFE2E8F0));
  }

  static AppColors greyScale400() {
    return AppColors._(const Color(0xFFCBD5E0));
  }

  static AppColors greyScale500() {
    return AppColors._(const Color(0xFFA0AEC0));
  }

  static AppColors greyScale600() {
    return AppColors._(const Color(0xFF718096));
  }

  static AppColors greyScale700() {
    return AppColors._(const Color(0xFF232B38));
  }

  static AppColors greyScale800() {
    return AppColors._(const Color(0xFF213342));
  }

  static AppColors greyScale900() {
    return AppColors._(const Color(0xFF1A202C));
  }

  static AppColors blueGrey() {
    return AppColors._(const Color(0xFF8EB9DE));
  }

  static AppColors withe() {
    return AppColors._(const Color(0xFFFFFFFF));
  }

  static AppColors success() {
    return AppColors._(SUCCESS);
  }

  static AppColors warning() {
    return AppColors._(WARNING);
  }

  static AppColors error() {
    return AppColors._(ERROR);
  }

  Color withOpacity10() {
    return _color!.withOpacity(0.1);
  }

  Color withOpacity20() {
    return _color!.withOpacity(0.2);
  }

  Color withOpacity30() {
    return _color!.withOpacity(0.3);
  }

  Color withOpacity40() {
    return _color!.withOpacity(0.4);
  }

  Color withOpacity50() {
    return _color!.withOpacity(0.5);
  }

  Color withOpacity60() {
    return _color!.withOpacity(0.6);
  }

  Color withOpacity70() {
    return _color!.withOpacity(0.7);
  }

  Color withOpacity80() {
    return _color!.withOpacity(0.8);
  }

  Color withOpacity90() {
    return _color!.withOpacity(0.9);
  }

  Color withOpacity100() {
    return _color!.withOpacity(1);
  }
}
