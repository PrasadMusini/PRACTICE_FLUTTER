import 'package:flutter/material.dart';

class StoryProvider extends ChangeNotifier {
  bool _isSeen = false;
  final Map<int, int> _lastSeenStoryIndex =
      {}; // Stores last seen story index for each user
  // bool isStorySeen = false;

  bool get isStorySeen => _isSeen;

  set isStorySeen(bool value) {
    _isSeen = value;
    notifyListeners();
  }

  int getLastSeenStoryIndex(int userId) {
    return _lastSeenStoryIndex[userId] ?? 0;
  }

  void updateLastSeenStoryIndex(int userId, int storyIndex) {
    _lastSeenStoryIndex[userId] = storyIndex;
    notifyListeners();
  }
}
