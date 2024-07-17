import 'dart:mirrors';

import 'package:dart_server/controller/controller.dart';
import 'package:dart_server/controller/request_hooker.dart';
import 'package:super_annotations/super_annotations.dart';

class HookerGenerator {
  static bool hasMappingAnnotation(List<dynamic> annotations) {
    return annotations.any((element) => element is Mapping);
  }

  static Mapping getMappingAnnotation(List<dynamic> annotations) {
    return annotations.firstWhere((element) => element is Mapping);
  }

  static RequestHooker generateHooker(Method method, Class target) {
    if (!hasMappingAnnotation(method.resolvedAnnotations)) {
      throw Exception("No annotation found");
    }
    Mapping annotation = getMappingAnnotation(method.resolvedAnnotations);
    final handler = target.methods
        .firstWhere((element) => element.name == method.name)
        .name;
    return RequestHooker(
        route: annotation.path,
        method: annotation.method,
        handler: ((request) => "hello"));
  }
}
