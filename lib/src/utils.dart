import 'dart:html';
import 'package:uuid/uuid.dart';

void EnableMobileDeviceSupport() {
  var meta = new MetaElement();
  meta.name = 'viewport';
  meta.content = 'width=device-width, initial-scale=1, maximum-scale=1';
  document.head.append(meta);
}

String GenerateRandomID() {
  return 'unique${new Uuid().v1().toString().replaceAll('-', '').substring(5)}';
}