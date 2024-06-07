import 'package:flutter/material.dart';

class MeetingControls extends StatelessWidget {
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;
  final bool micEnabled;
  final bool camEnabled;

  const MeetingControls({
    Key? key,
    required this.onToggleMicButtonPressed,
    required this.onToggleCameraButtonPressed,
    required this.onLeaveButtonPressed,
    required this.micEnabled,
    required this.camEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: onLeaveButtonPressed,
          child: const Icon(Icons.exit_to_app_outlined),
        ),
        ElevatedButton(
          onPressed: onToggleMicButtonPressed,
          child: Icon(micEnabled ? Icons.mic_outlined : Icons.mic_off_outlined),
        ),
        ElevatedButton(
          onPressed: onToggleCameraButtonPressed,
          child: Icon(camEnabled ? Icons.videocam_outlined : Icons.videocam_off_outlined),
        ),
      ],
    );
  }
}
