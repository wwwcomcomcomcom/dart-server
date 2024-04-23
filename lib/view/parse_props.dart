

import 'package:dart_server/view/template.dart';
import 'package:html/dom.dart';


void executeIfProp(Element element,String key, Model model){
  final pathValue = element.attributes[key];
  if(pathValue == null) return;
  if(element.parent == null) return;
  dynamic data = model.readData(pathValue);
  if(data is! bool)return;
  if(!data){
    element.removeSelf();
  }
}