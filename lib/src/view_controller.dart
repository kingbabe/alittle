import 'dart:html';
import 'view.dart';

class AlittleViewController {
  /// view controller scoped data
  Map<String, Object> _data = {};

  Map<String, Object> get data => _data;
  set data(Map newValue) {
    _data = newValue;
    // TODO: trigger view updates
  }

  /// view controller's root view
  View view = new View();

  Node render() => view.render();

  // lifecycle
  viewDidLoad() {
    view.classes.add(VIEW_CONTROLLER_CLASS);
  }

  viewWillAppear() {}
  viewWillDisappear() {}

  presentViewController(AlittleViewController viewController, [bool animated]) {
    if (viewController == null) {
      throw 'view controller to present can not be null';
    }
    viewController.viewDidLoad();
    if (animated == null || animated == false) {
      document.body.append(viewController.render());
    } else {
      // TODO: animated present
    }
    viewController.viewWillAppear();
    this.viewWillDisappear();
  }

}