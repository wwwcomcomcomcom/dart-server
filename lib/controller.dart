import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Controller{

  Controller(String url);

  Controller.regist(String url,Router router){
    router.get(url,get);
    router.head(url,head);
    router.post(url,post);
    router.put(url,put);
    router.delete(url, delete);
    router.connect(url,connect);
    router.options(url,options);
    router.trace(url,trace);
    router.patch(url, patch);
  }

  late final String url;

  Response get(Request request) {
    return Response(HttpStatus.notImplemented);
  }

  Response head() {
    return Response(HttpStatus.notImplemented);
  }

  Response post() {
    return Response(HttpStatus.notImplemented);
  }

  Response put() {
    return Response(HttpStatus.notImplemented);
  }

  Response delete() {
    return Response(HttpStatus.notImplemented);
  }

  Response connect() {
    return Response(HttpStatus.notImplemented);
  }

  Response options() {
    return Response(HttpStatus.notImplemented);
  }

  Response trace() {
    return Response(HttpStatus.notImplemented);
  }
  
  Response patch() {
    return Response(HttpStatus.notImplemented);
  }
}