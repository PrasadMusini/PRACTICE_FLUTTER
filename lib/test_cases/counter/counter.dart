class Counter {
  int _count = 0;

  int get count => _count;

  void incrementCount() {
    _count++;
  }

  void decrementCounter() {
    _count--;
  }

  void resetCount() {
    _count = 0;
  }
}
