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

  AudioCache cache;
  AudioPlayer player;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  void _playFile() async {
    player = await cache.play('my_audio.mp3'); // assign player here
  }

  void _stopFile() {
    player?.stop(); // stop the file like this
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
            final player = AudioCache();
            print('Ola?');
            if (idle) {
              player.play('audio/DoYou.mp3');
              /**await arkitController.playAnimation(
                  key: 'walking',
                  sceneName: 'models.scnassets/WalkingFixed.dae',
                  animationIdentifier: 'WalkingFixed-1');*/

            } else {
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
