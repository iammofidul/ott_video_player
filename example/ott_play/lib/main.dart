import 'package:flutter/material.dart';
import 'package:ott_video_player/ott_video_player.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTT Video Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return Scaffold(
      appBar:AppBar(
        leading: Container(),
        titleSpacing: 0,
        toolbarHeight:  width * 0.57,
        leadingWidth: 0,
        title: AspectRatio(
          aspectRatio: 16/9,
          child: OttVideoPlayer(videoUrl: "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8"),
        ),
      ),
        body:Container(child: Text("jch"),) );

  }
}
//http://playertest.longtailvideo.com/adaptive/wowzaid3/playlist.m3u8
//https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8
//https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8