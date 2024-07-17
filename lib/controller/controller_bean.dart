import 'package:dart_server/controller/request_hooker.dart';
import 'package:shelf_router/shelf_router.dart';

class ControllerBean {
  List<RequestHooker> requestHookers = [];

  ControllerBean.registAll(Router router) {
    for (var hooker in requestHookers) {
      hooker.regist(router);
    }
  }
}
