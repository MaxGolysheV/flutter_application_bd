
import 'package:flutter_secure_storage_web/flutter_secure_storage_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  FlutterSecureStorageWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
