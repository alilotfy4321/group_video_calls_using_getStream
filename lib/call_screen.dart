// ignore_for_file: unnecessary_import, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

class CallScreen extends StatefulWidget {
  final Call call;

  const CallScreen({
    Key? key,
    required this.call,
  }) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: StreamCallContainer(
        call: widget.call,
        callContentBuilder: (
          BuildContext context,
          Call call,
          CallState callState,
        ) {
          return StreamCallContent(
            call: call,
            callState: callState,
            callControlsBuilder: (
              BuildContext context,
              Call call,
              CallState callState,
            ) {
              final localParticipant = callState.localParticipant!;
              return StreamCallControls(
                options: [
                  CallControlOption(
                    icon: const Icon(Icons.chat_outlined),
                    onPressed: () {
                      // Open your chat window
                    },
                  ),
                  FlipCameraOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  AddReactionOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  ToggleMicrophoneOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  ToggleCameraOption(
                    call: call,
                    localParticipant: localParticipant,
                  ),
                  LeaveCallOption(
                    call: call,
                    onLeaveCallTap: () {
                      call.leave();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}