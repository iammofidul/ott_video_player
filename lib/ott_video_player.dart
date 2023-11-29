library ott_video_player;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OttVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final bool showCustomControls; // Example of an extra feature
  const OttVideoPlayer({
    required this.videoUrl,
    this.showCustomControls = true,
    Key? key,
  }) : super(key: key);

  @override
  OttVideoPlayerState createState() => OttVideoPlayerState();
}

class OttVideoPlayerState extends State<OttVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
   return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller,),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
