import 'dart:convert';
import 'package:crypto/crypto.dart';

extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  String generateMD5() {
    return md5.convert(utf8.encode(trim())).toString();
  }
}
