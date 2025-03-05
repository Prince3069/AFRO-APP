// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:video_player/video_player.dart';

// class LearnScreen extends StatefulWidget {
//   static const String routeName = '/learn';

//   const LearnScreen({super.key});

//   @override
//   _LearnScreenState createState() => _LearnScreenState();
// }

// class _LearnScreenState extends State<LearnScreen> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
//     )..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Learn & Teach"),
//         backgroundColor: Colors.blueGrey[900],
//         elevation: 0,
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.grey[100],
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Explore a world of learning!",
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               "Learn new languages, traditional food, and cultural arts. Start teaching or take a course today!",
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             const SizedBox(height: 20),
//             Text(
//               "Recommended Course",
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall!
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             GestureDetector(
//               onTap: () async {
//                 final url = "https://youtu.be/r4YIdn2eTm4?si=LV5GkPr3XCRoPTQZ";
//                 if (await canLaunch(url)) {
//                   await launch(url);
//                 } else {
//                   throw "Could not open the link.";
//                 }
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.blueGrey[900],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.play_circle_fill, color: Colors.white),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         "Watch: Learn & Teach on Udemy",
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleMedium!
//                             .copyWith(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               "In-App Video Player",
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//             const SizedBox(height: 12),
//             _controller.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: VideoPlayer(_controller),
//                   )
//                 : const Center(child: CircularProgressIndicator()),
//             IconButton(
//               icon: Icon(
//                 _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//               ),
//               onPressed: () {
//                 setState(() {
//                   _controller.value.isPlaying
//                       ? _controller.pause()
//                       : _controller.play();
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

import 'dart:io';

import 'package:afro_caribbean/screens/video_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class LearnScreen extends StatefulWidget {
  static const String routeName = '/learn';
  const LearnScreen({super.key});

  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  late VideoPlayerController _controller;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickAndUploadVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video == null) return;

    setState(() {
      _isUploading = true;
    });

    File videoFile = File(video.path);
    String fileName = "videos/${DateTime.now().millisecondsSinceEpoch}.mp4";

    try {
      TaskSnapshot snapshot = await _storage.ref(fileName).putFile(videoFile);
      String downloadUrl = await snapshot.ref.getDownloadURL();

      await _firestore
          .collection('videos')
          .add({'url': downloadUrl, 'uploadedAt': Timestamp.now()});

      setState(() {
        _isUploading = false;
      });
    } catch (e) {
      setState(() {
        _isUploading = false;
      });
      print("Error uploading video: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn & Teach"),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Upload & Learn!",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Upload your teaching videos or learn from others.",
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            _isUploading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: _pickAndUploadVideo,
                    child: const Text("Upload Video"),
                  ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: _firestore
                    .collection('videos')
                    .orderBy('uploadedAt', descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No videos uploaded yet."));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var videoData = snapshot.data!.docs[index];
                      return ListTile(
                        leading: const Icon(Icons.video_library,
                            color: Colors.blueGrey),
                        title: Text("Video ${index + 1}"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  VideoPage(videoUrl: videoData['url']),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
