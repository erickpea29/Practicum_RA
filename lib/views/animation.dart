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

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

  int contar = 0;
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
  String path = 'audio/derecho_romano.mp3';

  playMusic() async {
    await audioCache.play(path);
  }

  pauseMusic() async {
    await audioPlayer.stop();
  }

  void playAnimation(String llave, String dir, String id) async {
    k = llave;
    await arkitController.playAnimation(
        key: llave, sceneName: dir, animationIdentifier: id);
    contar++;
  }

  stopAnimation(String llave) async {
    await arkitController.stopAnimation(key: llave);
  }

  String k = "";
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

              playAnimation(
                  'talk4', 'models.scnassets/talk_4Fixed', 'talk_4Fixed-1');
              await Future.delayed(const Duration(seconds: 10));
              playAnimation(
                  'talk6', 'models.scnassets/talk_6Fixed', 'talk_6Fixed-1');
              await Future.delayed(const Duration(seconds: 30));
              playAnimation(
                  'talk5', 'models.scnassets/talk_5Fixed', 'talk_5Fixed-1');
              await Future.delayed(const Duration(seconds: 15));
              playAnimation(
                  'talk2', 'models.scnassets/talk_2Fixed', 'talk_2Fixed-1');
              await Future.delayed(const Duration(seconds: 20));
              playAnimation(
                  'talk1', 'models.scnassets/talk_1Fixed', 'talk_1Fixed-1');
              await Future.delayed(const Duration(seconds: 44));
            } else {
              pauseMusic();
              stopAnimation(k);
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
      url: 'models.scnassets/idle_1Fixed.dae',
      position: vector.Vector3(0, 0, 0),
      scale: vector.Vector3(0.0005, 0.0005, 0.0005),
    );
    controller?.add(node!, parentNodeName: anchor.nodeName);
  }
}
