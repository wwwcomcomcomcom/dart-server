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

  dynamic readModel(String path) {
    List<String> keyPath = path.split(".");
    dynamic currentValue = data;
    for (String key in keyPath) {
      if (currentValue == null) break;
      currentValue = currentValue[key];
    }
    return currentValue;
  }
}

void spreadElements(Element element) {

  final Model model = Model({
    "test": {
      "result": true,
      "value":"HELLOWORLD"
    }
  });

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
    element.innerHtml = model.readModel(element.innerHtml).toString();
    print(element.innerHtml);
  }

  print(element.localName);
  if (element.children.isNotEmpty) {
    element.children.forEach(spreadElements);
  }
}

Command parseCommand(String command, String arg, Model model) {
  dynamic value = model.readModel(arg);

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

String parseTemplate() {
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

  //TODO: make stringify
  
  return component.outerHtml;
}
