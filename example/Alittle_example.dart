import 'package:Alittle/Alittle.dart';
import 'dart:html';

class MyApp extends AlittleAppDelegate {
  @override
  onShow() {
  }

  @override
  onHide() {

  }

  @override
  onLaunch(Map<String, Object> options) {
    EnableMobileDeviceSupport();
    var vc = new MyViewController();
    this.rootViewController = vc;
  }

  @override
  onLoad(Map<String, Object> query) {

  }

  @override
  onError(Error e) {

  }
}

class MyViewController extends AlittleViewController {

  @override
  viewDidLoad() {
    super.viewDidLoad();
    var btn = new Button();
    CssStyleDeclaration style = new CssStyleDeclaration();
    style.backgroundColor = 'red';
    btn.setStyle(style, UIStates.hilighted);
    btn.onClick = (Event e) {
      window.alert('clicked');
    };
    this.view.addSubView(btn);
  }

}

main() {
  AlittleApplicationRun(new MyApp(), null);
}
