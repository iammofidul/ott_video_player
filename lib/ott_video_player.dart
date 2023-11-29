library ott_video_player;

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OttVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const OttVideoPlayer({required this.videoUrl, Key? key}) : super(key: key);
  @override
  OttVideoPlayerState createState() => OttVideoPlayerState();
}

class OttVideoPlayerState extends State<OttVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
   ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
     init();
  }
  void init()async{
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio, // Adjust this according to your video aspect ratio
      autoPlay: true,
      looping: true,
      // Other customization options can be added here
    );
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController!=null?Chewie(controller: _chewieController!):SizedBox.shrink();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
