import 'package:flutter/material.dart';
import 'package:practice_flutter/gen/assets.gen.dart';
import 'package:practice_flutter/gen/fonts.gen.dart';

class Constants {
  static const Color orangeColor = Color(0XFFea552b);
  static const txW6F18Cb = TextStyle(
      fontFamily: FontFamily.sora,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 18);

  static const txW6F18Cg = TextStyle(
      fontFamily: FontFamily.sora,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 101, 101, 101),
      fontSize: 16);

  static const txW6F16Cb = TextStyle(
      fontFamily: FontFamily.sora,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 18);

  static const txW6F18Cw = TextStyle(
      fontFamily: FontFamily.sora,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 18);

  static const txW8FsCb = TextStyle(
      fontFamily: FontFamily.sora,
      color: Colors.black,
      fontWeight: FontWeight.w800);

  static const txW5FsCb = TextStyle(
      fontFamily: FontFamily.sora,
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static const txW8FpCw = TextStyle(
      fontFamily: FontFamily.poppins,
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static const txW5FpCw = TextStyle(
      fontFamily: FontFamily.sora,
      color: Colors.white,
      fontWeight: FontWeight.w500);
  static const txW5FpCb = TextStyle(
      fontFamily: FontFamily.sora,
      color: Colors.black,
      fontWeight: FontWeight.w500);

  static const txW7FpCb = TextStyle(
      fontFamily: FontFamily.sora,
      color: Colors.black,
      fontWeight: FontWeight.w700);
  static const txW4FsCb38 = TextStyle(
      fontFamily: FontFamily.sora,
      color: Colors.black38,
      fontWeight: FontWeight.w500);
  static const txW7FsCo = TextStyle(
      fontFamily: FontFamily.sora,
      color: orangeColor,
      fontWeight: FontWeight.w700);
}

List<User> userData = [
  User(
      dates: '2015 - 2017',
      course: 'Programming Course',
      university: 'Harvard University'),
  User(
      dates: '2018 - 2021',
      course: 'Programming Course',
      university: 'California University'),
  User(
      dates: '2021 - 2023',
      course: 'Computer Science',
      university: 'Stanford University'),
];

class User {
  final String dates;
  final String course;
  final String university;
  User({required this.dates, required this.course, required this.university});
}
