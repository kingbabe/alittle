import 'dart:html';

void GlobalResetStyle(CssStyleDeclaration style) {
  style.display = 'flex';
  style.flex = '1';
  style.boxSizing = 'border-box';
}

class View {
  Element _element;
  CssStyleDeclaration get style => _element?.style;
  List<View> subViews = [];

  Node cache;

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
    _element = new Element.div();
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
    return fragment;
  }
}

class Button extends View {

}