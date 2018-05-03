import 'app_delegate.dart';
import 'dart:html';

void AlittleApplicationRun(AlittleAppDelegate delegate, Map<String, Object> options) {
  _SetRuntimeViewProperties();
  delegate.onLaunch(null);
  if (delegate.rootViewController == null) {
    throw 'Application launched without any view setted';
  }
  AlittleApplication.sharedApplication().viewControllers.add(delegate.rootViewController);
}

void _SetRuntimeViewProperties() {
  document.body.style.display = 'flex';
  document.body.style.backgroundColor = '#000';
}

class AlittleApplication {
  static final AlittleApplication _ins = new AlittleApplication._internal();

  /// singleton
  static AlittleApplication sharedApplication() {
    return _ins;
  }

  /// singleton
  factory AlittleApplication() {
    return _ins;
  }

  // internal constructor
  AlittleApplication._internal() {}

  List<AlittleViewController> viewControllers = [];
}