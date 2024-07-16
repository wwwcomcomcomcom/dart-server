import 'package:dart_server/controller/request_hooker.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ControllerBean {
  List<RequestHooker> requestHookers = [];

  ControllerBean.registAll(Router router) {
    for (var hooker in requestHookers) {
      hooker.regist(router);
    }
  }

  Future<Map<String, String>> parseRequestBody(Request request) async {
    //default content type: x-www-form-urlencoded
    final String rawData = await request.readAsString();
    Map<String, String> data = Uri.splitQueryString(rawData);
    return data;
  }
}
