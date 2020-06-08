import 'package:crypto/crypto.dart';
import 'dart:convert';

String encrypt(String data) {
  var bytes = utf8.encode(data);
  return sha1.convert(bytes).toString();
}