import 'package:flutter/material.dart';

class AnimationProvider with ChangeNotifier {
  bool toggle = false;
  late AnimationController controller;

  setToggle(bool toggle) {
    this.toggle = toggle;
    notifyListeners();
  }

  setAnimationController(AnimationController controller) {
    this.controller = controller;
  }
}
