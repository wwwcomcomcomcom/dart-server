//lib
// import 'package:dart_server/dart_server.dart';
import 'package:dart_server/config/config_util.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> arguments) async {
  final router = Router();
  final Config config = ConfigUtil.readConfig();
  final server = await serve(router.call, config.HOST, config.PORT);
  print("Server running at http://${server.address.host}:${server.port}");
}
