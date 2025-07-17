// ignore_for_file: deprecated_member_use, use_build_context_synchronously, use_super_parameters

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:task1/call_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Room'),
      ),
      body: Center(
        child:  ElevatedButton(
          child: const Text('Call'),
          onPressed: () async {
            try {
              //  check permissions before creating a call
              // If permissions are not granted, request them
              // If permissions are granted, proceed to create or join a call
              if (!await _requestPermissions(context)) return;
              var call = StreamVideo.instance.makeCall(
                callType: StreamCallType(),
                id: 'rTjb1VDlTY8W',
              );
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => CallScreen(call: call)),
              );

              await call.getOrCreate();

              // Created ahead
            } catch (e) {
              debugPrint('Error joining or creating call: $e');
              debugPrint(e.toString());
            }
          },
        )),
      
    );
  }
    // طلب صلاحيات الكاميرا والميكروفون
  Future<bool> _requestPermissions(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    bool allGranted = statuses.values.every((status) => status.isGranted);

    if (!allGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يجب السماح باستخدام الكاميرا والميكروفون'),
        ),
      );
    }

    return allGranted;
  }
}