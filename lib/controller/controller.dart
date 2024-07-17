import 'package:dart_server/controller/hooker_generator.dart';
import 'package:dart_server/http/http_method.dart';
import 'package:super_annotations/super_annotations.dart';

class Controller extends ClassAnnotation {
  const Controller();

  @override
  void apply(Class target, LibraryBuilder output) {
    final requestHookers = target.methods
        .where((method) => hasAnnotation<Mapping>(method.resolvedAnnotations))
        .map((method) => HookerGenerator.generateHooker(method, target))
        .toList();
    output.body.build().where((sp) {
      if (sp is Method) {
        return true;
      }
      return false;
    });

    output.body.add(Field((b) => b
      ..name = 'requestHookers'
      ..type = refer('List<RequestHooker>')
      ..modifier = FieldModifier.var$
      ..assignment = literalList([]).code));

    target.methods.map((method) => {});
  }
}

bool hasAnnotation<T>(List<dynamic> annotations) {
  annotations.firstWhere((element) => element is T);
  return annotations.any((element) => element is T);
}

class Mapping {
  final HttpMethod method;
  final String path;
  const Mapping(this.method, this.path);
}

class GetMapping extends Mapping {
  const GetMapping(String path) : super(HttpMethod.GET, path);
}
