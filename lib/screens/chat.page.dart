import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazobia/functions/list.function.dart';
import 'package:wazobia/functions/text.functions.dart';
import 'package:wazobia/screens/boardcast.page.dart';

class ChatPage extends StatefulWidget {
  final Map<String, String> allChatList;
  const ChatPage(this.allChatList, {super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 22.0),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      CircleAvatar(
                        backgroundImage: const AssetImage('assets/images/users.png'),
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
                      const SizedBox(width: 10.0),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.allChatList['name']!,
                              style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                            ),
                            Text(
                              'Active now',
                              style: getFontsStyles(9.5, const Color(0xFF272727), weight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Image.asset('assets/images/call.png'),
                      const SizedBox(width: 20.0),
                      Image.asset('assets/images/video.png'),
                      const SizedBox(width: 20.0),
                      Image.asset('assets/images/more.png')
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Text(
                              'You accepted the request',
                              style: getFontsStyles(10.0, const Color(0xFF272727), weight: FontWeight.w100),
                            ),
                            const SizedBox(height: 30.0),
                            const CircleAvatar(
                              backgroundImage: AssetImage('assets/images/users.png'),
                              radius: 40.0,
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Lagatha Lestrange',
                              style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                            ),
                            const SizedBox(height: 6.0),
                            Text(
                              widget.allChatList['name']!,
                              style: getFontsStyles(10.0, const Color(0xFF272727), weight: FontWeight.w100),
                            ),
                            const SizedBox(height: 20.0),
                            GestureDetector(
                              onTap: () => Get.to(() => const BoardCastPage()),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                                decoration: BoxDecoration(color: const Color(0xFFFCE7FE), borderRadius: BorderRadius.circular(100.0)),
                                child: Text(
                                  'View profile',
                                  style: getFontsStyles(10.0, const Color(0xFFE10BF4), weight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              'Today',
                              style: getFontsStyles(10.0, const Color(0xFF9C9C9C), weight: FontWeight.w400),
                            ),
                            const SizedBox(height: 30.0),
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: getAllChats().length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, i) => !getAllChats()[i]['isSenders']
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                                          decoration: const BoxDecoration(
                                              color: Color(0xFF272727),
                                              borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(100.0),
                                                topLeft: Radius.circular(100.0),
                                                topRight: Radius.circular(100.0),
                                              )),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('${getAllChats()[i]['message']}', style: getFontsStyles(12.0, const Color(0xFFFFFFFF), weight: FontWeight.w400)),
                                              const SizedBox(width: 5.0),
                                              Image.asset(
                                                'assets/images/delievered.png',
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 3.0),
                                        Text(
                                          '07:23 am',
                                          style: getFontsStyles(10.0, const Color(0xFF525252), weight: FontWeight.w400),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFEBEBEB),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(100.0),
                                                topLeft: Radius.circular(100.0),
                                                topRight: Radius.circular(100.0),
                                              )),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('${getAllChats()[i]['message']}', style: getFontsStyles(12.0, const Color(0xFF272727), weight: FontWeight.w400)),
                                              const SizedBox(width: 5.0),
                                              Image.asset(
                                                'assets/images/delievered.png',
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 3.0),
                                        Text(
                                          '07:23 am',
                                          style: getFontsStyles(10.0, const Color(0xFF525252), weight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 20.0),
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
                      style: getFontsStyles(12.0, const Color(0xFF6E6E6E), weight: FontWeight.w400),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: 'Message ${widget.allChatList['name']}',
                        hintStyle: getFontsStyles(12.0, const Color(0xFF6E6E6E), weight: FontWeight.w400),
                        contentPadding: const EdgeInsets.all(0.0),
                        prefixIcon: Image.asset(
                          'assets/images/attachcircle.png',
                          width: 25.0,
                          height: 25.0,
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/emoji.png',
                              width: 23.0,
                              height: 23.0,
                            ),
                            const SizedBox(width: 10.0),
                            Image.asset(
                              'assets/images/mic.png',
                              width: 23.0,
                              height: 23.0,
                            ),
                            const SizedBox(width: 17.0),
                          ],
                        ),
                        border: const OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 13.0),
                Image.asset(
                  'assets/images/send.png',
                  width: 20.0,
                  height: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      )),
    );
  }
}
