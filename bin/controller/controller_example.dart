import 'package:dart_server/controller/controller.dart';

@Controller()
class ExampleController {
  @GetMapping('/example')
  String example() {
    return 'example';
  }
}
