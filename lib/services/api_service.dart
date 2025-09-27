import 'dart:io';
import 'package:flutter/foundation.dart';

class ApiService {
  static String get baseUrl {
    if (kIsWeb) {
      return "http://127.0.0.1:8000";
    } else if (Platform.isAndroid) {
      return "http://10.0.2.2:8000";
    } else if (Platform.isIOS) {
      return "http://127.0.0.1:8000";
    } else {
      return "http://127.0.0.1:8000";
    }
  }
}
