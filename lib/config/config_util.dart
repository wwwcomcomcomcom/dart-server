// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

class ConfigUtil {
  static Config readConfig() {
    File file = File('config.properties');
    String fileData = file.readAsStringSync();
    Map<String, dynamic> config = jsonDecode(fileData);
    if (!config.containsKey('PORT') || !config['PORT'] is int) {
      throw Exception('PORT not found or invalid in config file');
    }
    if (!config.containsKey('HOST') || !config['HOST'] is String) {
      throw Exception('HOST not found or invalid in config file');
    }
    return Config(PORT: config['PORT'], HOST: config['HOST']);
  }
}

class Config {
  final int PORT;
  final String HOST;
  Config({required this.PORT, required this.HOST});
}
