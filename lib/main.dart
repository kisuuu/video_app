import 'package:flutter/material.dart';
import 'package:video_recorder/screens/camera_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraPage(),
    );
  }
}






















// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:video_player/video_player.dart';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blue,
//       // ),
//       debugShowCheckedModeBanner: false,
//       home: VideoCapture(),
//     );
//   }
// }

// class VideoCapture extends StatefulWidget {
//   @override
//   State<VideoCapture> createState() => _VideoCaptureState();
// }

// class _VideoCaptureState extends State<VideoCapture> {
//   final ImagePicker _picker = ImagePicker();
//   VideoPlayerController? _controller;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Choose Mode"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 200, // <-- Your width
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     final XFile? file = await _picker.pickVideo(
//                         source: ImageSource.camera,
//                         maxDuration: const Duration(seconds: 45));
//                     setState(() {});
//                     _playVideo(file);
//                     // print("Video Path ${file!.path}");
//                   },
//                   child: Text(
//                     'Normal Recording',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               SizedBox(
//                 width: 200, // <-- Your width
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     final XFile? file = await _picker.pickVideo(
//                         source: ImageSource.camera,
//                         maxDuration: const Duration(seconds: 10));
//                     setState(() {});
//                     _playVideo(file);
//                     // print("Video Path ${file!.path}");
//                   },
//                   child: Text(
//                     'Slow Motion',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               _previewVideo(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _previewVideo() {
//     if (_controller == null) {
//       return const Text(
//         '',
//       );
//     }
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           AspectRatioVideo(_controller),
//         ],
//       ),
//     );
//   }

//   Future<void> _playVideo(XFile? file) async {
//     if (file != null && mounted) {
//       await _disposeVideoController();
//       late VideoPlayerController controller;
//       /*if (kIsWeb) {
//         controller = VideoPlayerController.network(file.path);
//       } else {*/
//       controller = VideoPlayerController.file(File(file.path));
//       //}
//       _controller = controller;
//       // In web, most browsers won't honor a programmatic call to .play
//       // if the video has a sound track (and is not muted).
//       // Mute the video so it auto-plays in web!
//       // This is not needed if the call to .play is the result of user
//       // interaction (clicking on a "play" button, for example).

//       //await controller.setVolume(volume);
//       await controller.initialize();
//       await controller.setLooping(true);
//       await GallerySaver.saveVideo(file.path);
//       // print(
//       //     "::::::::::::::::::::::::::::::::::::::${file.path}::::::::::::::::::::::::::::::");
//       // File(file.path).deleteSync();
//       await controller.play();

//       setState(() {});
//     } else {}
//   }

//   Future<void> _disposeVideoController() async {
//     /*  if (_toBeDisposed != null) {
//       await _toBeDisposed!.dispose();
//     }
//     _toBeDisposed = _controller;*/
//     _controller = null;
//   }
// }

// class AspectRatioVideo extends StatefulWidget {
//   const AspectRatioVideo(this.controller, {Key? key}) : super(key: key);

//   final VideoPlayerController? controller;

//   @override
//   AspectRatioVideoState createState() => AspectRatioVideoState();
// }

// class AspectRatioVideoState extends State<AspectRatioVideo> {
//   VideoPlayerController? get controller => widget.controller;
//   bool initialized = false;

//   void _onVideoControllerUpdate() {
//     if (!mounted) {
//       return;
//     }
//     if (initialized != controller!.value.isInitialized) {
//       initialized = controller!.value.isInitialized;
//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     controller!.addListener(_onVideoControllerUpdate);
//   }

//   @override
//   void dispose() {
//     controller!.removeListener(_onVideoControllerUpdate);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (initialized) {
//       return Column(
//         children: [
//           Row(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.ac_unit),
//                 onPressed: () async {},
//               )
//             ],
//           ),
//           Center(
//             child: AspectRatio(
//               aspectRatio: controller!.value.aspectRatio,
//               child: VideoPlayer(controller!),
//             ),
//           ),
//         ],
//       );
//     } else {
//       return Container();
//     }
//   }
// }
