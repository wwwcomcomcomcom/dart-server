import "dart:io";

import "package:dart_server/controller.dart";
import "package:shelf/shelf.dart";
// import 'dart:html';/

class WelcomeController extends Controller {
  WelcomeController(super.url);

  WelcomeController.regist(super.url, super.router) : super.regist();
  @override
  Response get(Request request) {
    return Response.ok('<h1>Welcome to Dart Server</h1>',
        headers: {"Content-Type": "text/html; charset=utf-8"});
  }
}
