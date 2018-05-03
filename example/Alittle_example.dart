import 'package:Alittle/Alittle.dart';

class MyApp extends AlittleAppDelegate {
  @override
  onShow() {
  }

  @override
  onHide() {

  }

  @override
  onLaunch(Map<String, Object> options) {
    this.rootViewController = new AlittleViewController();
  }

  @override
  onLoad(Map<String, Object> query) {

  }

  @override
  onError(Error e) {

  }
}

main() {
  AlittleApplicationRun(new MyApp(), null);
}
