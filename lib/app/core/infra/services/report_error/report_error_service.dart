import 'dart:io';

import 'package:flutter/cupertino.dart';

class ErrorReport {
  static Future<void> _report(
    dynamic exception,
    StackTrace stackTrace,
    String reportTag,
  ) async {
    if (!(Platform.environment.containsKey('FLUTTER_TEST')) &&
        exception != null) {
      debugPrintStack(label: reportTag, stackTrace: stackTrace);
      // Envia para o back end
    }
  }

  static void externalFailureError(
      dynamic exception, StackTrace? stackTrace, String? reportTag) {
    if (stackTrace != null && reportTag != null) {
      _report(exception, stackTrace, 'EXTERNAL_FAILURE: ${reportTag.trim()}');
    }
  }
}
