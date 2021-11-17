import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class CustomAnimationPage extends StatefulWidget {
  @override
  _CustomAnimationPageState createState() => _CustomAnimationPageState();
}

class _CustomAnimationPageState extends State<CustomAnimationPage> {
  late ARKitController arkitController;
  ARKitReferenceNode? node;
  bool idle = true;

  //bool play = false;
  // AudioPlayer _audioPlayer = AudioPlayer();
  // AudioCache _audioCache = AudioCache();
  // AudioPlayerState _audioPlayerState = AudioPlayerState();

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

  void initState() {
    super.initState();

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        playerState = s;
      });
    });
  }

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState playerState = PlayerState.PAUSED;
  AudioCache audioCache = AudioCache();
  String path = 'audio/DoYou.mp3';

  playMusic() async {
    await audioCache.play(path);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Custom Animation'),
          backgroundColor: Color.fromRGBO(255, 89, 0, 1),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            idle ? Icons.play_arrow : Icons.stop,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(255, 89, 0, 1),
          onPressed: () async {
            if (idle) {
              playMusic();
              /**await arkitController.playAnimation(
                  key: 'walking',
                  sceneName: 'models.scnassets/WalkingFixed.dae',
                  animationIdentifier: 'WalkingFixed-1');*/

            } else {
              pauseMusic();
              /*await arkitController.stopAnimation(key: 'walking');*/

            }
            setState(() => idle = !idle);
          },
        ),
        body: Container(
          child: ARKitSceneView(
            showFeaturePoints: true,
            planeDetection: ARPlaneDetection.horizontal,
            onARKitViewCreated: onARKitViewCreated,
          ),
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = _handleAddAnchor;
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if (!(anchor is ARKitPlaneAnchor)) {
      return;
    }
    _addPlane(arkitController, anchor);
  }

  void _addPlane(ARKitController? controller, ARKitPlaneAnchor anchor) {
    if (node != null) {
      controller?.remove(node!.name);
    }
    node = ARKitReferenceNode(
      url: 'models.scnassets/IdleFixed.dae',
      position: vector.Vector3(0, 0, 0),
      scale: vector.Vector3(0.0015, 0.0015, 0.0015),
    );
    controller?.add(node!, parentNodeName: anchor.nodeName);
  }
}
