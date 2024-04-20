import "dart:io";

import "package:dart_server/controller.dart";
import "package:html/parser.dart";
import "package:shelf/shelf.dart";
// import 'dart:html';/



class WelcomeController extends Controller {

  WelcomeController(super.url);

  WelcomeController.regist(super.url, super.router) : super.regist();
  @override
  Response get(Request request){
    
    final file = File('bin/frontend/index.html');
    final fileData = file.readAsStringSync();
    var component = parse("<h1>template?<h1>");
    print(component.outerHtml);
    return Response.ok(fileData,headers:{});
  }
}