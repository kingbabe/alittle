import 'dart:html';
import 'utils.dart';
import 'application.dart';

const VIEW_CONTROLLER_CLASS = 'view-controller';

void GlobalResetStyle(CssStyleDeclaration style) {
  style.display = 'flex';
  style.flex = '1';
}

class View {
  Element _element = new Element.div();
  String _id;
  CssStyleDeclaration get style => _element.style;
  List<View> subViews = [];

  Node cache;
  String get id => _id;
  set id(String newValue) {
    this._element.id = newValue;
    _id = newValue;
  }

  /// classes
  CssClassSet get classes => _element.classes;

  /// judge if a view is hidden
  bool _hidden = false;

  set hidden(bool hidden) {
    if (_hidden != hidden) {
      _hidden = hidden;
      this.style.display = hidden ? 'none' : 'flex';
    }
  }

  bool get hidden => _hidden;


  View() {
    GlobalResetStyle(this.style);
    this.style.backgroundColor = '#fff';
  }

  addSubView(View view) {
    if (view != null) {
      this.subViews.add(view);
    }
  }

  Node render() {
    if (cache != null) {
      return cache;
    }
    if (subViews.length == 0) {
      return this._element;
    }
    var fragment = new DocumentFragment();
    subViews.forEach((view) {
      fragment.append(view.render());
    });
    this._element.append(fragment);
    cache = this._element;
    return cache;
  }
}

enum UIStates {
  normal,
  hilighted,
  disabled,
}

class Button extends View {
  @override
  Element _element = new Element.a();
  static const defaultHeight = 44;

  String get title => _element.text;
  set title(String newValue) => _element.text = newValue;

  /// event related
  int _touchTimeout = 0;


  EventListener onClick;
  EventListener onLongPress;

  Button() {
    this.id = GenerateRandomID();
    this.style.flex = null;
    this.style.backgroundColor = null;
    this.title = 'button';
    this.classes.add('alittle-button');
    this._element.addEventListener('touchstart', this.touchStart);
    this._element.addEventListener('touchend', this.touchEnd);
  }

  touchStart(Event e) {
    e.preventDefault();
    this._element.classes.toggle('$id-active');
    _touchTimeout = new DateTime.now().millisecondsSinceEpoch;
  }

  touchEnd(Event e) {
    this._element.classes.toggle('$id-active');
    int gap = new DateTime.now().millisecondsSinceEpoch - _touchTimeout;
    if (gap >= 500) {
      if (onLongPress != null) {
        onLongPress(e);
      }
    } else {
      if (onClick != null) {
        onClick(e);
      }
    }
  }

  setStyle(CssStyleDeclaration style, UIStates state) {
    if (style == null) {
      return;
    }
    switch (state) {
      case UIStates.normal: break;
      case UIStates.hilighted:
        GlobalStyleSheet.insertRule('.$id-active {${style.cssText}}');
        break;
      case UIStates.disabled:
        GlobalStyleSheet.insertRule('.$id-disabled {${style.cssText}');
        break;
      default: break;
    }
  }

}