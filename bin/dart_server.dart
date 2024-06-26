
//lib
import 'package:dart_server/dart_server.dart';
import 'controller/member_controller.dart';
import 'controller/welcome_controller.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// ignore: constant_identifier_names
const int PORT = 8000;
// ignore: constant_identifier_names
const String HOST = "localhost";
bool isServerOpened = false;

void main(List<String> arguments) async {
  final router = Router();

  // router.get('/',(Request request){
  //   return Response.ok(fileData,headers:{'Content-Type':"text/html; charset=utf-8"});
  // });
  WelcomeController.regist("/", router);
  MemberController.regist("/member", router);
  final server = await serve(router.call,HOST,PORT);

  print("Server running at http://${server.address.host}:${server.port}");

  calculate();
}
