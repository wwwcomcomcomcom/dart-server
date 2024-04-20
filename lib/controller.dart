import 'dart:io';

import 'package:shelf/shelf.dart';

abstract class Controller{

  Controller(String url);

  late final String url;

  Response get() {
    return Response(HttpStatus.notImplemented);
  }

  Response post() {
    return Response(HttpStatus.notImplemented);
  }

  Response delete() {
    return Response(HttpStatus.notImplemented);
  }
  
  Response patch() {
    return Response(HttpStatus.notImplemented);
  }
}