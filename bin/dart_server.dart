import 'dart:io';
void main(List<String> arguments) async {
  final server = await HttpServer.bind('localhost',8000);
  server.listen((request) {
    final response = request.response;
    response.statusCode = HttpStatus.ok;
    response.headers.add('Content-Type', 'text/html');
    response.write('<h1>Hello, world</h1>');
    response.close();
  });
  print('Server running at http://localhost:8000');
}
