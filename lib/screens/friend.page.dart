import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazobia/functions/list.function.dart';
import 'package:wazobia/functions/text.functions.dart';
import 'package:wazobia/screens/chat.page.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 22.0),
          Container(
            height: 40.0,
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(height: 22.0),
          Expanded(
              child: ListView.builder(
                  itemCount: getAllChatList().length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Get.to(() => ChatPage(getAllChatList()[index])),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(getAllChatList()[index]['image']!),
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
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          getAllChatList()[index]['name']!,
                                          style: getFontsStyles(14.0, const Color(0xFF272727), weight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        getAllChatList()[index]['time']!,
                                        style: getFontsStyles(9.5, const Color(0xFF272727), weight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          getAllChatList()[index]['lastmessage']!,
                                          style: getFontsStyles(9.5, const Color(0xFF272727), weight: FontWeight.w400),
                                        ),
                                      ),
                                      getAllChatList()[index]['isMessage'] == 'delivered'
                                          ? Image.asset(
                                              'assets/images/delievered.png',
                                            )
                                          : getAllChatList()[index]['isMessage'] == 'sent'
                                              ? Image.asset(
                                                  'assets/images/sent.png',
                                                )
                                              : Image.asset(
                                                  'assets/images/number.png',
                                                ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]),
                        ),
                      )))
        ],
      ),
    );
  }
}
