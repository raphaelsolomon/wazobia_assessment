import 'package:flutter/material.dart';
import 'package:wazobia/functions/list.function.dart';
import 'package:wazobia/functions/text.functions.dart';

class BoardCastPage extends StatefulWidget {
  const BoardCastPage({super.key});

  @override
  State<BoardCastPage> createState() => _BoardCastPageState();
}

class _BoardCastPageState extends State<BoardCastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/screen.png'), fit: BoxFit.fill)),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/users.png'),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'You',
                              style: getFontsStyles(10.0, const Color(0xFFFFFFFF), weight: FontWeight.w700),
                            ),
                            Text(
                              '1.3k viewers',
                              style: getFontsStyles(8.5, const Color(0xFFFFFFFF), weight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(color: const Color(0xFFF44747), borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'LIVE',
                              style: getFontsStyles(12.0, const Color(0xFFFFFFFF), weight: FontWeight.w600),
                            ),
                            const SizedBox(width: 10.0),
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              '00:41',
                              style: getFontsStyles(12.0, const Color(0xFFFFFFFF), weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Transform.rotate(
                        angle: 0.8,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.end, children: List.generate(getAllViewer().length, (index) => viewsWidgets(index)).reversed.toList())),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 40.0,
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: const Color(0xFFEBEBEB),
                        ),
                        child: TextField(
                          style: getFontsStyles(12.0, const Color(0xFF272727), weight: FontWeight.w400),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'Drop a comment...',
                            hintStyle: getFontsStyles(12.0, const Color(0xFF272727), weight: FontWeight.w400),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                            border: const OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 13.0),
                    CircleAvatar(
                      radius: 23.0,
                      child: Image.asset(
                        'assets/images/send.png',
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
            Positioned(bottom: 80, right: -5.0, child: Transform.rotate(angle: -0.1, child: viewsHearts())),
          ],
        ),
      )),
    ));
  }

  Widget viewsWidgets(int index) => Opacity(
        opacity: index >= 3 && index < 4
            ? 1.0
            : index >= 4 && index < 5
                ? 0.5
                : index > 4
                    ? 0.4
                    : 1.0,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: Row(children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/users.png'),
            ),
            const SizedBox(width: 15.0),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${getAllViewer()[index]['name']}',
                    style: getFontsStyles(14.0, Colors.white, weight: FontWeight.w500),
                  ),
                  Text(
                    '${getAllViewer()[index]['comment']}',
                    style: getFontsStyles(9.5, Colors.white, weight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ]),
        ),
      );

  Widget viewsHearts() => Column(
        children: [
          Row(children: [
            Image.asset(
              'assets/heart/heart-2.png',
              width: 17.16,
              height: 17.16,
            ),
            const SizedBox(width: 2.0),
            Image.asset(
              'assets/heart/heart-5.png',
              width: 17.16,
              height: 17.16,
            ),
          ]),
          const SizedBox(height: 0.0),
          Row(children: [
            Image.asset(
              'assets/heart/heart-1.png',
              width: 20.0,
              height: 20.0,
            ),
            const SizedBox(width: 2.0),
            Image.asset(
              'assets/heart/heart-4.png',
              width: 20.0,
              height: 20.0,
            ),
          ]),
          const SizedBox(height: 0.0),
          Row(children: [
            Image.asset(
              'assets/heart/heart.png',
              width: 30.0,
              height: 30.0,
            ),
            const SizedBox(width: 2.0),
            Image.asset(
              'assets/heart/heart-3.png',
              width: 30.0,
              height: 30.0,
            ),
          ])
        ],
      );
}
