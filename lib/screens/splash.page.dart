import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazobia/functions/text.functions.dart';
import 'package:wazobia/screens/home.page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.off(() => const HomeFeeds());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            RotationTransition(
                turns: _controller,
                child: Align(
                  alignment: const Alignment(0.4, 0.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(color: Color(0xFFE10BF4), shape: BoxShape.circle),
                  ),
                )),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 110.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: const Color(0xFFF39DFB),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'WeCook',
                    style: getFontsStyles(18.0, const Color(0xFF232323), weight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
