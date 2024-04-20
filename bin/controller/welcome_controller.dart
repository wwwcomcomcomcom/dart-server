import "package:dart_server/controller.dart";
import "package:shelf/shelf.dart";


class WelcomeController extends Controller {
  
  WelcomeController(super.url);

  @override
  Response get(){
    return Response.ok("Hello");
  }
}