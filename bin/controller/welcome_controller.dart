import "package:dart_server/controller.dart";
import "package:shelf/shelf.dart";


class WelcomeController extends Controller {

  WelcomeController(super.url);

  WelcomeController.regist(super.url, super.router) : super.regist();

  @override
  Response get(Request request){
    return Response.ok("Hello");
  }
}