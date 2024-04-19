import 'dart:io';

import 'package:shelf/shelf.dart';

abstract class Controller {
  Controller();
  
  Response get() {
    return Response(HttpStatus.ok);
  }

  Response post() {
    return Response(HttpStatus.ok);
  }

  Response delete() {
    return Response(HttpStatus.ok);
  }
  
  Response patch() {
    return Response(HttpStatus.ok);
  }
}