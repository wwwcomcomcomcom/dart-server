import "package:dart_server/controller.dart";
import "package:dart_server/view/template.dart";
import "package:shelf/shelf.dart";
// import 'dart:html';/



class WelcomeController extends Controller {

  WelcomeController(super.url);

  WelcomeController.regist(super.url, super.router) : super.regist();
  @override
  Response get(Request request){
    
    
    return Response.ok(parseTemplate(),headers:{"Content-Type":"text/html; charset=utf-8"});
  }
}