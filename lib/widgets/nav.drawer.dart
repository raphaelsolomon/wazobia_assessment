import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wazobia/controllers/animation.controller.dart';
import 'package:wazobia/functions/text.functions.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Function(int i, AnimationController animationController) callBack;
  const CustomBottomNavBar(this.callBack, {super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 275),
    );

    context.read<AnimationProvider>().setAnimationController(_controller);
    _animation = CurvedAnimation(parent: context.read<AnimationProvider>().controller, curve: Curves.easeOut, reverseCurve: Curves.easeIn);
    context.read<AnimationProvider>().controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
              onTap: () {
                index = 0;
                if (context.read<AnimationProvider>().toggle) {
                  context.read<AnimationProvider>().controller.reverse();
                }
                widget.callBack(index, _controller);
              },
              child: itemList(context, index == 0 ? 'assets/images/home_1.png' : 'assets/images/home.png', '  Feeds  ')),
          GestureDetector(
              onTap: () {
                index = 1;
                if (context.read<AnimationProvider>().toggle) {
                  context.read<AnimationProvider>().controller.reverse();
                }
                widget.callBack(index, _controller);
              },
              child: itemList(context, index == 1 ? 'assets/images/message_1.png' : 'assets/images/messages.png', '  Chats  ')),
          GestureDetector(
            onTap: () {
              if (!context.read<AnimationProvider>().toggle) {
                context.read<AnimationProvider>().setToggle(!context.read<AnimationProvider>().toggle);
                index = 5;
                context.read<AnimationProvider>().controller.forward();
                widget.callBack(5, _controller);
              } else {
                context.read<AnimationProvider>().setToggle(!context.read<AnimationProvider>().toggle);
                index = 5;
                widget.callBack(5, _controller);
                context.read<AnimationProvider>().controller.reverse();
              }
            },
            child: Transform.rotate(
              angle: _animation.value * pi * (3 / 4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                width: context.watch<AnimationProvider>().toggle ? 50.0 : 45.0,
                height: context.watch<AnimationProvider>().toggle ? 50.0 : 45.0,
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(width: 2.5, color: const Color(0xFFE10BF4)),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Color(0xFFE10BF4),
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                index = 3;
                if (context.read<AnimationProvider>().toggle) {
                  context.read<AnimationProvider>().controller.reverse();
                }
                widget.callBack(index, _controller);
              },
              child: itemList(context, 'assets/images/archive.png', 'Bookmarks')),
          GestureDetector(
              onTap: () {
                index = 4;
                if (context.read<AnimationProvider>().toggle) {
                  context.read<AnimationProvider>().controller.reverse();
                }
                widget.callBack(index, _controller);
              },
              child: itemList(context, 'assets/images/profile.png', ' Profile ')),
        ],
      ),
    );
  }

  Widget itemList(BuildContext context, String image, String label) => Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(image),
        Text(
          label,
          style: getFontsStyles(10.0, const Color(0xFF272727), weight: FontWeight.w100),
        )
      ]);
}
