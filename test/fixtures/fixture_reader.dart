import 'dart:io';

String fixture(String fileName) {
  String jsonString;
  try {
    jsonString = File('test/fixtures/json/$fileName').readAsStringSync();
  } on FileSystemException {
    jsonString = File('../test/fixtures/json/$fileName').readAsStringSync();
  }
  return jsonString;
}
