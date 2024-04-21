// I tried to use 'html_template' in pub, but code didn't generated.

//Todo:

import 'dart:io';
import 'package:html/dom.dart';
// ignore: library_prefixes
import 'package:html/parser.dart' as HtmlParser;

const prototypeHTML = 'bin/frontend/template_prototype.html';

void spreadElements(Element element){
  print("${element.localName}");
  if(element.children.isNotEmpty){
    element.children.forEach(spreadElements);
  }
}

String parseTemplate(){
  final file = File(prototypeHTML);
  final fileData = file.readAsStringSync();
  final component = HtmlParser.parse(fileData);
  //html body h2
  final html = component.children[0];
  spreadElements(html);
  // html.children[1].children[1].attributes.forEach((key, value) {
  //   key = key.toString();
  //   print("key : $key value: $value");
    
  // },);

  // print(component);
  return fileData;
}