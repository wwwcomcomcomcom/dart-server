import 'package:dart_server/controller.dart';
import 'package:shelf/shelf.dart';


class HomeController extends Controller {

  HomeController(super.url);
  
  HomeController.regist(super.url, super.router) : super.regist();

  @override
  Response get(Request request){
    return Response.ok("asdf");
  }
}