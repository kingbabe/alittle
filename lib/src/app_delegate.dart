// app
import 'view_controller.dart';
import 'application.dart';
import 'dart:html';

abstract class AlittleAppDelegate {
  void onLaunch(Map<String, Object> options);
  void onLoad(Map<String, Object> params);
  void onShow();
  void onHide();
  void onError(Error e);

  /// the root view controller
  AlittleViewController _rootViewController;

  set rootViewController(AlittleViewController controller) {
    if (controller == null) {
      throw 'root view controller cannot be null';
    }
    _rootViewController = controller;
    controller.viewDidLoad();
    document.body.append(controller.render());
    controller.viewWillAppear();
    AlittleApplication.sharedApplication().viewControllers = [ controller ];
  }

  get rootViewController => _rootViewController;
  /// app global scoped data
  /// you can store global data here
  Map<String, Object> data = {};
}

