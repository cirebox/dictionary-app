import 'package:intl/intl.dart';

class Utils {
  static bool isNullOrEmpty(dynamic value) {
    return (value == '' ||
        value == null ||
        value == 'null' ||
        value.toString().trim() == '');
  }

  static String returnDefaultStringIfNullOrEmpty(
      dynamic value, String defaultValue) {
    return Utils.isNullOrEmpty(value.toString().trim()) ? defaultValue : value;
  }

  static double returnDefaultDoubleIfNullOrEmpty(
      dynamic value, double defaultValue) {
    return Utils.isNullOrEmpty(value.toString().trim()) ? defaultValue : value;
  }

  static int returnDefaultIntIfNullOrEmpty(dynamic value, int defaultValue) {
    return Utils.isNullOrEmpty(value.toString().trim()) ? defaultValue : value;
  }

  static String currencyFormatter(double value,
      {int? decimalDigits = 0, bool? withSymbol = true}) {
    final formatter = NumberFormat.currency(
        locale: 'pt_BR',
        symbol: withSymbol! ? 'R\$' : '',
        decimalDigits: decimalDigits);

    return formatter.format(value);
  }

  static double removeCurrencyFormat(String value) {
    return Utils.stringToDouble(value
        .trim()
        .replaceAll('R\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.'));
  }

  static getDateFromIsoDate(String isoDate) {
    if (!isNullOrEmpty(isoDate)) {
      var dateParts = isoDate.split(".");
      var actualDate = DateTime.parse("${dateParts[0]}Z");
      return actualDate;
    }
  }

  static String doubleToPercent(double value) {
    if (isNullOrEmpty(value)) {
      return '0.0';
    }

    return (value * 100).toStringAsFixed(1);
  }

  static String addCharAtPosition(String text, String char, int position) {
    if (position > text.length) {
      return text;
    }
    final leftText = text.substring(0, position);
    final rightText = text.substring(position);

    return leftText + char + rightText;
  }

  static double stringToDouble(String value) {
    try {
      if (value.contains(RegExp(r'.,'))) {
        return double.parse(value.replaceAll('.', '').replaceAll(',', '.'));
      }
      return double.parse(value);
    } catch (exception) {
      throw Exception(exception);
    }
  }

  static String formatDateString(String dateString) {
    // Convert date string from "dd/MM/yyyy" to "yyyy-MM-dd" format
    List<String> parts = dateString.split('/');
    String formattedDateString =
        "${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}";
    return formattedDateString;
  }
}
