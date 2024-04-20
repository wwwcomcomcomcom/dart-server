// I tried to use 'html_template' in pub, but code didn't generated.

//Todo:

import 'dart:io';
// ignore: library_prefixes
import 'package:html/parser.dart' as HtmlParser;

String parseTemplate(){
  final file = File('bin/frontend/index.html');
  final fileData = file.readAsStringSync();
  var component = HtmlParser.parse(fileData);
  print(component);
  return fileData;
}