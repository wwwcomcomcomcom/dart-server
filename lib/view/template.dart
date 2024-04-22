// I tried to use 'html_template' in pub, but code didn't generated.

//Todo:

import 'dart:io';
import 'package:html/dom.dart';
// ignore: library_prefixes
import 'package:html/parser.dart' as HtmlParser;

const prototypeHTML = 'bin/frontend/template_prototype.html';

enum Command { show, delete, error }

class Model {
  final Map<String, dynamic> data;

  Model(this.data);

  dynamic readData(String path) {
    List<String> keyPath = path.split(".");
    dynamic currentValue = data;
    for (String key in keyPath) {
      if (currentValue == null) break;
      currentValue = currentValue[key];
    }
    return currentValue;
  }
}

void spreadElements(Element element, Model model) {
  // ignore: no_leading_underscores_for_local_identifiers
  element.attributes.forEach((_key, value) {
    var key = _key.toString();
    if (key.startsWith("*")) {
      final rawCommand = key.substring(1);
      final command = parseCommand(rawCommand, value, model);
      print(command);
    }
  });
  if (element.localName == "tmp-text") {
    element.innerHtml = model.readData(element.innerHtml).toString();
    print(element.innerHtml);
  }

  print(element.localName);
  
  if (element.children.isNotEmpty) {
    for (var element in element.children) {
      spreadElements(element, model);
    }
  }
}

Command parseCommand(String command, String arg, Model model) {
  dynamic value = model.readData(arg);

  switch (command) {
    case "if":
      if (value is bool && value) {
        return Command.show;
      } else {
        return Command.delete;
      }
    // break;
    default:
      return Command.error;
  }
}

void executeCommand() {}

String parseTemplate(String rawHtml) {
  final component = HtmlParser.parse(rawHtml);
  final html = component.children[0];

  final Model model = Model({
    "test": {"result": true, "value": "HELLOWORLD"}
  });

  spreadElements(html, model);

  return component.outerHtml;
}
