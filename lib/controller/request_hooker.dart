import 'package:dart_server/http/http_method.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class RequestHooker {
  final String route;
  final HttpMethod method;
  final Function(Request request) handler;
  RequestHooker(
      {required this.route, required this.method, required this.handler});

  void regist(Router router) {
    router.add(method.name, route, handler);
  }
}
