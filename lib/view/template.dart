// I tried to use 'html_template' in pub, but code didn't generated.

//Todo:

import 'dart:collection';
import 'package:html/dom.dart';
// ignore: library_prefixes
import 'package:html/parser.dart' as HtmlParser;
import 'parse_props.dart' as PropParser;
const prototypeHTML = 'bin/frontend/template_prototype.html';

enum CommandMethod {
  show,
  delete,
  error
}

class Command {
  Command(CommandMethod method);
  late CommandMethod method;
  dynamic data;
}

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

extension ElementExtension on Element {
  bool removeSelf(){
    if(parent ==  null) return false;
    parent!.children.remove(this);
    return true;
  }
  bool replaceToString(String string){
    if(parent ==  null) return false;
    NodeList nodes = parent!.nodes;
    nodes[nodes.indexOf(this)] = Text(string);
    nodes.remove(this);
    return true;
  }
  void removeTemplateProps(){
    final LinkedHashMap<Object,String> newAttributes = LinkedHashMap();
    // ignore: no_leading_underscores_for_local_identifiers
    attributes.forEach((_key, value) {
      final String key = _key.toString();
      if(!key.startsWith("*")) newAttributes.addAll({key:value});
    });
    attributes = newAttributes;
  }
}

void spreadElements(Element element, Model model) {
  // ignore: no_leading_underscores_for_local_identifiers
  element.attributes.forEach((_key, value) {
    final key = _key.toString();
    switch (key) {
      case "*if":
        PropParser.executeIfProp(element,key,model);
      break;
      default:break;
    }
    element.removeTemplateProps();
  });
  if (element.localName == "tmp-text") {
    element.replaceToString(model.readData(element.innerHtml).toString());
  }

  if (element.children.isNotEmpty) {
    for (var element in element.children) {
      spreadElements(element, model);
    }
  }
}

CommandMethod parseCommand(String command, String arg, Model model) {
  dynamic value = model.readData(arg);

  switch (command) {
    case "if":
      if (value is bool && value) {
        return CommandMethod.show;
      } else {
        return CommandMethod.delete;
      }
    // break;
    default:
      return CommandMethod.error;
  }
}

Element removeFrangments(Element element){
  for (var element in element.children) {
    element.attributes.containsKey("*");
  }
  return element;
}

void readAttributes(LinkedHashMap attributes){

}

abstract class TemplateHTML implements Element {
  
}

void executeCommand() {}

String parseTemplate(String rawHtml) {
  final component = HtmlParser.parse(rawHtml);
  final html = component.children[0];

  final Model model = Model({
    "test": {"result": true, "value": "HELLOWORLD", "value2":"helloworld","value3":"asdfjioedfs"}
  });

  spreadElements(html, model);

  return component.outerHtml;
}
