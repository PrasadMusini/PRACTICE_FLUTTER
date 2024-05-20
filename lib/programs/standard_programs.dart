import 'package:flutter/material.dart';

class StandedPrograms extends StatefulWidget {
  const StandedPrograms({super.key});

  @override
  State<StandedPrograms> createState() => _StandedProgramsState();
}

class _StandedProgramsState extends State<StandedPrograms> {
  List<int> nums = [
    0,
    0,
    2,
    4,
    6,
    6,
    8,
  ];

  @override
  void initState() {
    super.initState();

    removeDuplicatesUsingloop();
    fibonacci();
    findMostRepeatedValue();
    removeDuplicatesUsingSetDataStructure();
    removeDuplicates(nums);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void fibonacci() {
    int a = 0;
    int b = 1;
    int c = 0;
    String result = '';

    for (var i = 0; i < 10; i++) {
      result += '$c ';
      a = b;
      b = c;
      c = a + b;
    }
    print('fibonacci: $result');
  }

  void removeDuplicatesUsingSetDataStructure() {
    Set<int> removeDuplicates = nums.toSet();
    List result = removeDuplicates.toList();
    print('Remove duplicates using set: $result');
  }

  void removeDuplicatesUsingloop() {
    // List result = [];

    // 1 2 3 4 1

    // 1 2 3 4 1

    for (int i = 0; i < nums.length; i++) {
      int count = 0;
      for (int j = 0; j < nums.length; j++) {
        for (int k = j; k < nums.length; k++) {
          if (nums[i] == nums[k]) {
            count++;
            print('count');
          }
        }
      }
      if (count == 1) {
        print(nums[i]);
      }
    }
  }

  List<T> removeDuplicates<T>(List<T> list) {
    List<T> result = [];

    for (int i = 0; i < list.length; i++) {
      bool isDuplicate = false;

      // Check if the current element has already been encountered
      for (int j = 0; j < i; j++) {
        if (list[i] == list[j]) {
          isDuplicate = true;
          break;
        }
      }

      // If the element is not a duplicate, add it to the result list
      if (!isDuplicate) {
        result.add(list[i]);
      }
    }
    print('Remove Duplicates: $result');
    return result;
  }

  void findMostRepeatedValue() {
    List<int> nums = [1, 2, 3, 4, 2, 5, 2, 1, 1, 11, 1];
    int result = 0;
    int value = -1;
    for (int i = 0; i < nums.length; i++) {
      int count = 0;
      for (int j = 0; j < nums.length; j++) {
        if (nums[i] == nums[j]) {
          count++;
        }
      }
      if (result < count) {
        result = count;
        value = nums[i];
      }
    }
    print('Most repeatted number in list: $value');
  }
}
