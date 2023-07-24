import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wazobia/controllers/animation.controller.dart';
import 'package:wazobia/functions/list.function.dart';
import 'package:wazobia/functions/text.functions.dart';
import 'package:wazobia/screens/boardcast.page.dart';
import 'package:wazobia/screens/friend.page.dart';
import 'package:wazobia/widgets/nav.drawer.dart';

class HomeFeeds extends StatefulWidget {
  const HomeFeeds({super.key});

  @override
  State<HomeFeeds> createState() => _HomeFeedsState();
}

class _HomeFeedsState extends State<HomeFeeds> {
  int currentPage = 0;
  late AnimationController controller;

  Alignment alignment1 = const Alignment(-100.0, 0.1);
  Alignment alignment2 = const Alignment(-100.0, 0.1);
  Alignment alignment3 = const Alignment(-100.0, 0.1);
  double size1 = 50.0;
  double size2 = 50.0;
  double size3 = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar((int i, AnimationController controller) {
        this.controller = controller;
        if (i != 5) {
          currentPage = i;
          context.read<AnimationProvider>().setToggle(false);
        }
        if (i == 5 && context.read<AnimationProvider>().toggle) {
          alignment1 = Alignment.bottomCenter;
          alignment2 = Alignment.bottomCenter;
          alignment3 = Alignment.bottomCenter;
        } else {
          alignment1 = const Alignment(-100.0, 0.1);
          alignment2 = const Alignment(-100.0, 0.1);
          alignment3 = const Alignment(-100.0, 0.1);
        }
        setState(() {});
      }),
      body: SafeArea(
          maintainBottomViewPadding: false,
          child: Stack(
            children: [
              GestureDetector(
                onPanDown: (details) {
                  if (context.read<AnimationProvider>().toggle) {
                    alignment1 = const Alignment(-100.0, 0.1);
                    alignment2 = const Alignment(-100.0, 0.1);
                    alignment3 = const Alignment(-100.0, 0.1);
                    context.read<AnimationProvider>().setToggle(!context.read<AnimationProvider>().toggle);
                    context.read<AnimationProvider>().controller.reverse();
                    setState(() {});
                  }
                },
                child: currentPage == 0
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 22.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hello Hamza',
                                          style: getFontsStyles(16.0, const Color(0xFF272727), weight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 5.0),
                                        Text(
                                          'Who do you want to cook with today?',
                                          style: getFontsStyles(12.0, const Color(0xFF272727), weight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.0),
                                        border: Border.all(width: 1.0, color: const Color(0xFFE0E0E0)),
                                      ),
                                      child: Image.asset('assets/images/notification.png'))
                                ],
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              height: 40.0,
                              padding: const EdgeInsets.symmetric(horizontal: 0.0),
                              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(width: 1.0, color: const Color(0xFFE0E0E0)),
                              ),
                              child: TextField(
                                style: getFontsStyles(12.0, const Color(0xFFBCBCBC), weight: FontWeight.w400),
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: getFontsStyles(12.0, const Color(0xFFBCBCBC), weight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.all(0.0),
                                  prefixIcon: Image.asset('assets/images/search.png'),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 20.0,
                                        color: const Color(0xFFBCBCBC),
                                        width: 1.0,
                                      ),
                                      const SizedBox(width: 10.0),
                                      Image.asset('assets/images/setting.png'),
                                    ],
                                  ),
                                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Discover',
                                    style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                                  ),
                                  Text(
                                    'See all',
                                    style: getFontsStyles(12.0, const Color(0xFFEB5CF8), weight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Row(
                                  children: List.generate(getAllDiscover().length, (index) => discoverWidget(getAllDiscover()[index])).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Trending posts',
                                    style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                                  ),
                                  Text(
                                    'See all',
                                    style: getFontsStyles(12.0, const Color(0xFFEB5CF8), weight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: const AssetImage('assets/images/video1.jpeg'),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 1.0,
                                                right: 0.0,
                                                child: Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.0), border: Border.all(width: 2.0, color: Colors.white)),
                                                  child: const CircleAvatar(
                                                    radius: 5.0,
                                                    backgroundColor: Color(0xFF36F855),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15.0),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Lagatha_24',
                                                style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                                              ),
                                              Text.rich(
                                                TextSpan(text: 'Florida ', children: [TextSpan(text: ' • ', style: getFontsStyles(12.5, const Color(0xFF000000), weight: FontWeight.w400)), const TextSpan(text: ' Jan 3rd, 12:14pm ')]),
                                                style: getFontsStyles(9.5, const Color(0xFF6E6E6E), weight: FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE10BF4),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Text(
                                      'Follow',
                                      style: getFontsStyles(10.0, const Color(0xFFFFFFFF), weight: FontWeight.w500),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'My process for making birthday cakes, take a look, my recipe is attached to this post.',
                                style: getFontsStyles(12.0, const Color(0xFF272727), weight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 241.0,
                              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/video1.jpeg'),
                                    fit: BoxFit.cover,
                                  )),
                              child: Center(
                                  child: Image.asset(
                                'assets/images/play.png',
                                width: 40.0,
                                height: 40.0,
                              )),
                            ),
                            const SizedBox(height: 15.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(text: '299K ', children: [
                                      TextSpan(
                                          text: 'views ',
                                          style: getFontsStyles(
                                            9.5,
                                            const Color(0xFF000000),
                                            weight: FontWeight.w400,
                                          )),
                                      TextSpan(
                                          text: ' • ',
                                          style: getFontsStyles(
                                            13.0,
                                            const Color(0xFF000000),
                                            weight: FontWeight.w600,
                                          )),
                                      const TextSpan(text: ' 29k '),
                                      TextSpan(
                                          text: 'likes ',
                                          style: getFontsStyles(
                                            9.5,
                                            const Color(0xFF000000),
                                            weight: FontWeight.w400,
                                          )),
                                    ]),
                                    style: getFontsStyles(10.0, const Color(0xFF6E6E6E), weight: FontWeight.w600),
                                  ),
                                  Flexible(
                                    child: Text.rich(
                                      TextSpan(text: '11k ', children: [
                                        TextSpan(
                                            text: 'Comments ',
                                            style: getFontsStyles(
                                              9.5,
                                              const Color(0xFF000000),
                                              weight: FontWeight.w400,
                                            )),
                                        TextSpan(
                                            text: ' • ',
                                            style: getFontsStyles(
                                              13.0,
                                              const Color(0xFF000000),
                                              weight: FontWeight.w700,
                                            )),
                                        const TextSpan(text: ' 2.5k '),
                                        TextSpan(
                                            text: 'Downloads ',
                                            style: getFontsStyles(
                                              9.5,
                                              const Color(0xFF000000),
                                              weight: FontWeight.w400,
                                            )),
                                      ]),
                                      style: getFontsStyles(10.0, const Color(0xFF6E6E6E), weight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Image.asset(
                                  'assets/images/like.png',
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                Image.asset(
                                  'assets/images/comment.png',
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                Image.asset(
                                  'assets/images/download.png',
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                Image.asset(
                                  'assets/images/share.png',
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                Image.asset(
                                  'assets/images/bookmark.png',
                                  width: 25.0,
                                  height: 25.0,
                                ),
                              ]),
                            ),
                            const SizedBox(height: 25.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Based on your Preferences',
                                    style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                                  ),
                                  Text(
                                    'See all',
                                    style: getFontsStyles(12.0, const Color(0xFFEB5CF8), weight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(getAllPreference().length, (index) => preferneceWidget(getAllPreference()[index])).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Currently live',
                                    style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                                  ),
                                  Text(
                                    'See all',
                                    style: getFontsStyles(12.0, const Color(0xFFEB5CF8), weight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(getAllLive().length, (index) => currentlyLive(getAllLive()[index])).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 0.0),
                          ],
                        ),
                      )
                    : const FriendPage(),
              ),
              GestureDetector(
                onTap: () {
                  if (context.read<AnimationProvider>().toggle) {
                    alignment1 = const Alignment(-100.0, 0.1);
                    alignment2 = const Alignment(-100.0, 0.1);
                    alignment3 = const Alignment(-100.0, 0.1);
                    context.read<AnimationProvider>().setToggle(!context.read<AnimationProvider>().toggle);
                    context.read<AnimationProvider>().controller.reverse();
                    setState(() {});
                  }
                },
                child: AnimatedAlign(
                  duration: context.watch<AnimationProvider>().toggle ? const Duration(milliseconds: 275) : const Duration(milliseconds: 375),
                  alignment: alignment1, //const Alignment(0.0, 1.0),
                  curve: context.watch<AnimationProvider>().toggle ? Curves.easeIn : Curves.easeOut,
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(right: 10.0, bottom: 45.0),
                    duration: context.watch<AnimationProvider>().toggle ? const Duration(milliseconds: 275) : const Duration(milliseconds: 375),
                    curve: context.watch<AnimationProvider>().toggle ? Curves.easeIn : Curves.easeOut,
                    width: size1,
                    height: size1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0xFFE10BF4),
                        )),
                    child: const Icon(
                      Icons.edit,
                      color: Color(0xFFE10BF4),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (context.read<AnimationProvider>().toggle) {
                    alignment1 = const Alignment(-100.0, 0.1);
                    alignment2 = const Alignment(-100.0, 0.1);
                    alignment3 = const Alignment(-100.0, 0.1);
                    context.read<AnimationProvider>().setToggle(!context.read<AnimationProvider>().toggle);
                    context.read<AnimationProvider>().controller.reverse();
                    setState(() {});
                  }
                },
                child: AnimatedAlign(
                  duration: context.watch<AnimationProvider>().toggle ? const Duration(milliseconds: 175) : const Duration(milliseconds: 275),
                  alignment: alignment2,
                  curve: context.watch<AnimationProvider>().toggle ? Curves.easeIn : Curves.easeOut,
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(
                      right: 110.0,
                    ),
                    duration: context.watch<AnimationProvider>().toggle ? const Duration(milliseconds: 175) : const Duration(milliseconds: 275),
                    curve: context.watch<AnimationProvider>().toggle ? Curves.easeIn : Curves.easeOut,
                    width: size2,
                    height: size2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0xFFE10BF4),
                        )),
                    child: const Icon(
                      Icons.video_call,
                      color: Color(0xFFE10BF4),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (context.read<AnimationProvider>().toggle) {
                    alignment1 = const Alignment(-100.0, 0.1);
                    alignment2 = const Alignment(-100.0, 0.1);
                    alignment3 = const Alignment(-100.0, 0.1);
                    context.read<AnimationProvider>().setToggle(!context.read<AnimationProvider>().toggle);
                    context.read<AnimationProvider>().controller.reverse();
                    setState(() {});
                    Future.delayed(const Duration(milliseconds: 400), () => Get.to(() => const BoardCastPage()));
                  }
                },
                child: AnimatedAlign(
                  duration: context.watch<AnimationProvider>().toggle ? const Duration(milliseconds: 275) : const Duration(milliseconds: 175),
                  alignment: alignment3,
                  curve: context.watch<AnimationProvider>().toggle ? Curves.easeIn : Curves.easeOut,
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(
                      left: 95.0,
                    ),
                    duration: context.watch<AnimationProvider>().toggle ? const Duration(milliseconds: 275) : const Duration(milliseconds: 175),
                    curve: context.watch<AnimationProvider>().toggle ? Curves.easeIn : Curves.easeOut,
                    width: size3,
                    height: size3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0xFFE10BF4),
                        )),
                    child: const Icon(
                      Icons.browse_gallery,
                      color: Color(0xFFE10BF4),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget currentlyLive(Map<String, String> liveMap) => Container(
        width: 300.0,
        height: 326.0,
        margin: const EdgeInsets.only(right: 20.0, left: 2.0, bottom: 10.0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0), boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: .0,
            blurRadius: 20.0,
            offset: Offset(0.0, 0.1),
          )
        ]),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('${liveMap['image']}'),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 1.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.0), border: Border.all(width: 2.0, color: Colors.white)),
                            child: const CircleAvatar(
                              radius: 3.0,
                              backgroundColor: Color(0xFF36F855),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${liveMap['name']}',
                          style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                        ),
                        Text.rich(
                          TextSpan(text: '${liveMap['country']} ', children: [
                            TextSpan(text: ' • ', style: getFontsStyles(12.5, const Color(0xFF000000), weight: FontWeight.w400)),
                            const TextSpan(text: ' Currently live'),
                          ]),
                          style: getFontsStyles(9.5, const Color(0xFF6E6E6E), weight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
                child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(0.0), topRight: Radius.circular(0.0)),
                  child: Image.asset(
                    '${liveMap['image']}',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF44747),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    child: Text(
                      'LIVE',
                      style: getFontsStyles(10.0, const Color(0xFFFFFFFF), weight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            )),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Text(
                    '${liveMap['title']}',
                    style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '${liveMap['desc']}',
                      textAlign: TextAlign.center,
                      style: getFontsStyles(10.0, const Color(0xFF272727), weight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE10BF4),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Request to join',
                        style: getFontsStyles(10.0, const Color(0xFFFFFFFF), weight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget preferneceWidget(Map<String, String> allPreference) => Container(
        width: 184.0,
        height: 220.0,
        margin: const EdgeInsets.only(right: 20.0, left: 2.0, bottom: 10.0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0), boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: .0,
            blurRadius: 20.0,
            offset: Offset(0.0, 0.1),
          )
        ]),
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                  child: Image.asset(
                    '${allPreference['image']}',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            )),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Text(
                    '${allPreference['name']}',
                    style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    '${allPreference['title']}',
                    style: getFontsStyles(10.0, const Color(0xFF272727), weight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE10BF4),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Send Friend Request',
                      style: getFontsStyles(10.0, const Color(0xFFFFFFFF), weight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget discoverWidget(Map<String, String> allDiscover) => Container(
        width: 130.0,
        height: 180.0,
        margin: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage('${allDiscover['image']}'),
              fit: BoxFit.cover,
            )),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                decoration: BoxDecoration(
                    color: const Color(0xFFE10BF4),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.white,
                    )),
                child: Text(
                  'NEW',
                  style: getFontsStyles(10.0, const Color(0xFFFFFFFF), weight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      child: Text(
                        '${allDiscover['name']} • ${allDiscover['age']}',
                        style: getFontsStyles(12.0, const Color(0xFFFFFFFF), weight: FontWeight.w500),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        '${allDiscover['country']}',
                        style: getFontsStyles(12.0, const Color(0xFFFFFFFF), weight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
