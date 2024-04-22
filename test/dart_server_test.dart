import 'dart:io';
import 'dart:math';

import 'package:dart_server/dart_server.dart';
import 'package:dart_server/view/template.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('parse template',(){
    final file = File(prototypeHTML);
    final fileData = file.readAsStringSync();
    
    print(parseTemplate(fileData));
  });
}
