import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_hammer/widget/detail_bottom_bar.dart';
import 'package:my_flutter_hammer/widget/video_player_widget.dart';

import 'package:video_player/video_player.dart';

class DetailPage extends StatefulWidget {
  final String videoUrl;
  final String img;
  const DetailPage({super.key, required this.videoUrl, required this.img});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;
  double aspectRatio = 750 / 360;
  void _initializeVideoPlayer() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      aspectRatio: aspectRatio, // Adjust aspect ratio as needed
      allowPlaybackSpeedChanging: true,
      hideControlsTimer: const Duration(seconds: 1),
      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.white,
        bufferedColor: Colors.grey,
        handleColor: Colors.white,
      ),
      placeholder: Container(
        color: Colors.black, //動画読み込み前の背景色
      ),
    );
  }

  int _likes = 0;
  int _comments = 0;
  int _shares = 0;
  bool isLike = false;

  void _likePost() {
    setState(() {
      isLike != isLike;
      if (isLike) {
        _likes--;
      } else {
        _likes++;
      }
    });
  }

  @override
  void initState() {
    _initializeVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    _videoPlayerController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        const Positioned(
          bottom: 0,
          left: 0,
          child: DetailBottomBar(),
        ),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.black,
              expandedHeight: ScreenUtil().setHeight(360),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.black,
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8),
                        Text(
                          'Video Detail Page',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(36),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget felis odio. Sed vitae neque pretium, convallis mauris in, interdum eros. Integer hendrerit massa nec nisi bibendum, ut vestibulum metus gravida. Vivamus tempus nisi vel sollicitudin luctus.',
                          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 8),
                            IconButton(
                              icon: Icon(Icons.thumb_up,
                                  color: Colors.white, size: 18),
                              onPressed: _likePost,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '$_likes',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            SizedBox(width: 16),
                            IconButton(
                              icon: Icon(Icons.comment,
                                  color: Colors.white, size: 18),
                              onPressed: () {},
                            ),
                            SizedBox(width: 8),
                            Text(
                              '$_comments',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            SizedBox(width: 16),
                            IconButton(
                              icon: Icon(Icons.share,
                                  color: Colors.white, size: 18),
                              onPressed: () {},
                            ),
                            SizedBox(width: 8),
                            Text(
                              '$_shares',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                        Divider(),

                        // Placeholder for more content
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
