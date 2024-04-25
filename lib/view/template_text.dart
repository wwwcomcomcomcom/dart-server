import 'package:dart_server/view/template.dart';
import 'package:html/dom.dart';

extension ElementExtension on Element {
  bool get isTemplateText => localName == "tmp-text";

  void parseTemplateText(Element element, Model model) {
    final data = model.readData(element.innerHtml);
    element.replaceToString(data);
    return;
  }

  Element parseAllTemplateText(Element element, Model model) {
    if (element.children.isEmpty) {
      if(element.isTemplateText) {
        element.parseTemplateText(element, model);
      }
      return element;
    }
    element.children.forEach((child) {
      parseAllTemplateText(child, model);
    });
    return element;
  }
}
