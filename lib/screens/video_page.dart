import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// class VideoPage extends StatefulWidget {
//   final String videoUrl;

//   const VideoPage({super.key, required this.videoUrl});

//   @override
//   // ignore: library_private_types_in_public_api
//   _VideoPageState createState() => _VideoPageState();
// }

// class _VideoPageState extends State<VideoPage> {
//   late VideoPlayerController _controller;
//   bool _isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     // ignore: deprecated_member_use
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _togglePlayPause() {
//     setState(() {
//       if (_controller.value.isPlaying) {
//         _controller.pause();
//         _isPlaying = false;
//       } else {
//         _controller.play();
//         _isPlaying = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Video Player"),
//         backgroundColor: Colors.blueGrey[900],
//       ),
//       backgroundColor: Colors.black,
//       body: Center(
//         child: _controller.value.isInitialized
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: VideoPlayer(_controller),
//                   ),
//                   const SizedBox(height: 20),
//                   FloatingActionButton(
//                     onPressed: _togglePlayPause,
//                     backgroundColor: Colors.white,
//                     child: Icon(
//                       _isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }
// }
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class VideoPage extends StatefulWidget {
//   final String videoUrl;

//   const VideoPage({super.key, required this.videoUrl});

//   @override
//   State<VideoPage> createState() => _VideoPageState();
// }

// class _VideoPageState extends State<VideoPage> {
//   late WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse(widget.videoUrl));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Watch Video"),
//         backgroundColor: Colors.blueGrey[900],
//       ),
//       body: WebViewWidget(controller: _controller),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPage extends StatefulWidget {
//   final String videoUrl;

//   const VideoPage({super.key, required this.videoUrl});

//   @override
//   _VideoPageState createState() => _VideoPageState();
// }

// class _VideoPageState extends State<VideoPage> {
//   late VideoPlayerController _controller;
//   bool _isPlaying = false;

//   @override
//   void initState() {
//     super.initState();

//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {}); // Ensure UI updates after initialization
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _togglePlayPause() {
//     setState(() {
//       if (_controller.value.isPlaying) {
//         _controller.pause();
//         _isPlaying = false;
//       } else {
//         _controller.play();
//         _isPlaying = true;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Video Player"),
//         backgroundColor: Colors.blueGrey[900],
//       ),
//       backgroundColor: Colors.black,
//       body: Center(
//         child: _controller.value.isInitialized
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: VideoPlayer(_controller),
//                   ),
//                   const SizedBox(height: 20),
//                   FloatingActionButton(
//                     onPressed: _togglePlayPause,
//                     backgroundColor: Colors.white,
//                     child: Icon(
//                       _isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }

class VideoPage extends StatefulWidget {
  final String videoUrl;
  const VideoPage({super.key, required this.videoUrl});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Video Player"),
          backgroundColor: Colors.blueGrey[900]),
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  const SizedBox(height: 20),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    backgroundColor: Colors.white,
                    child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.black),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
