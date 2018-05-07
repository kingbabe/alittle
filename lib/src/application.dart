import 'app_delegate.dart';
import 'view_controller.dart';
import 'dart:html';

final GlobalStyle = new StyleElement();

CssStyleSheet _globalStyleSheet = null;
CssStyleSheet get GlobalStyleSheet => _globalStyleSheet;

void AlittleApplicationRun(AlittleAppDelegate delegate, Map<String, Object> options) {
  _SetRuntimeViewProperties();
  delegate.onLaunch(null);
  if (delegate.rootViewController == null) {
    throw 'Application launched without any view setted';
  }
}

void _SetRuntimeViewProperties() {
  document.head.append(GlobalStyle);
  var styleSheet = document.styleSheets.last as CssStyleSheet;
  styleSheet.insertRule('* { -wbkit-touch-callout: none; touch-callout: none; -webkit-user-select: none; user-select: none; }');
  styleSheet.insertRule('* { margin: 0; padding: 0; box-sizing: border-box;}');
  styleSheet.insertRule('html, body { height: 100%; width: 100%; display: flex; background-color: white; }');
  styleSheet.insertRule('.view-controller { position: absolute; top: 0; left: 0; width: 100%; height: 100%; display: flex;}');
  styleSheet.insertRule('.alittle-button { height: 44px; align-items: center; justify-content: center; text-decoration: none;}');
  _globalStyleSheet = styleSheet;
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
