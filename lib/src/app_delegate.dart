// app
import 'view.dart';
import 'dart:html';

abstract class AlittleAppDelegate {
  void onLaunch(Map<String, Object> options);
  void onLoad(Map<String, Object> params);
  void onShow();
  void onHide();
  void onError(Error e);

  /// the root view
  AlittleViewController rootViewController;
  /// app global scoped data
  /// you can store global data here
  Map<String, Object> data = {};
}


class AlittleViewController {
  /// view controller scoped data
  Map<String, Object> _data = {};

  Map<String, Object> get data => _data;
  set data(Map newValue) {
    _data = newValue;
    // TODO: trigger view updates
  }

  // TODO: view class type
  View view;

  Node render() => view.render();

  // lifecycle
  loadView() {}
  viewDidLoad() {}
  viewWillAppear() {}
  viewDidAppear() {}
  viewDidFirstAppear() {}
  viewWillDisappear() {}
  viewDidDisappear() {}

}