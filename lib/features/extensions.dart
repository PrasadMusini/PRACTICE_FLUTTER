
//!  Syntax
//!  extension ExtensionName on ExtendedType {
//!    extension methods, getters, setters, and operators
//!  }

extension StringExtension on String {
  String get customReversed => split('').reversed.join();
}

extension IntExtension on int {
  bool get isItEven => this % 2 == 0;
  bool get isItOdd => this % 2 != 0;

  int get square => this * this;

  int operator *(int other) => this * 2 * other;
}
