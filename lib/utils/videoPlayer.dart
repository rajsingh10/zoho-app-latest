import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String? video;

  VideoWidget({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  bool _isThumbnailShown = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.video.toString())
      ..initialize().then((_) async {
        final duration = _controller.value.duration;
        final halfDuration =
            Duration(milliseconds: duration.inMilliseconds ~/ 2);

        // Show halfway thumbnail
        await _controller.seekTo(halfDuration);
        await _controller.pause();

        setState(() {});
      });

    _controller.setLooping(true);
    _controller.setVolume(0.0);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: widget.video == null || widget.video!.isEmpty
          ? Container()
          : Center(
              child: _controller.value.isInitialized
                  ? GestureDetector(
                      onTap: () async {
                        if (_isThumbnailShown) {
                          // Restart from beginning
                          await _controller.seekTo(Duration.zero);
                          await _controller.play();
                          setState(() {
                            _isThumbnailShown = false;
                          });
                        } else {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                          if (!_controller.value.isPlaying)
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(2.h),
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 6.h,
                              ),
                            ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator.adaptive(),
            ),
    );
  }
}
