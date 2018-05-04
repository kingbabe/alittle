import 'dart:html';

main() {
  CssStyleDeclaration style = new CssStyleDeclaration();
  style.display = 'flex';
  style.flex = '1';
  style.backgroundColor = '#000';
  print(style.cssText);
}