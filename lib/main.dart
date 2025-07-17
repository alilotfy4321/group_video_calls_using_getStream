// ignore_for_file: use_super_parameters, deprecated_member_use, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:task1/home_screen.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init StreamVideo one time
  initStreamVideo();
  

  runApp(const MyApp());
}
Future<void> initStreamVideo() async {
  // method Uuid().v4() generates a random userId for eavry user enter room
  final userId = 'user${const Uuid().v4().substring(0, 3)}';
  final user = User.regular(userId: userId, name: userId);
    StreamVideo(
     'hrzfeedj4qc3', // getStream API Key from this link(https://dashboard.getstream.io/app/1406055/chat/overview)
    user: user,
    userToken: getDevToken(userId), //this method create user token base on userId
  );
}

// This method generates a development token for the user
String getDevToken(String userId) {
  final header = {"alg": "HS256", "typ": "JWT"};
  final payload = {
    "user_id": userId,
    "exp": DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch ~/ 1000,
  };

  String encode(Map<String, dynamic> map) {
    return base64Url.encode(utf8.encode(json.encode(map))).replaceAll('=', '');
  }
  final encodedHeader = encode(header);
  final encodedPayload = encode(payload);
  final signature = base64Url.encode(utf8.encode("devtoken")).replaceAll('=', '');

  return "$encodedHeader.$encodedPayload.$signature";
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }


}

