/// Demonstrates how to play and pause a looping animation

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({Key? key}) : super(key: key);

  @override
  _PlayPauseAnimationState createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  /// Controller for playback
  // late RiveAnimationController _controller;
  Artboard? _riveArtboard;
  RiveAnimationController? _controller;
  SimpleAnimation? _animation1, _animation2;


  /// Tracks if the animation is playing by whether controller is running
  // bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/abcd.riv').then((data) async {
      final file = RiveFile.import(data);
      //   final artBoard = file.mainArtboard;
      final artBoard = file.artboardByName('Panther');
      _animation1 = SimpleAnimation('entry');
      _animation2 = SimpleAnimation('pass');
      artBoard!.addController(SimpleAnimation('idle'));
      setState(() => _riveArtboard = artBoard);
    });
  }

  void _togglePlay() {
   
      _riveArtboard!.removeController(_animation2!);
      _riveArtboard!.addController(_animation1!);
  
  }

   void _togglePlay2() {
    
      _riveArtboard!.removeController(_animation1!);
      _riveArtboard!.addController(_animation2!);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              child: _riveArtboard == null
                  ? const SizedBox()
                  : Rive(artboard: _riveArtboard!),
            ),
            /*   Container(
              height: 50,
              width: 50,
              child: GestureDetector(
                onTap: _togglePlay,
                child: Icon(Icons.favorite),
              ),
            ),*/
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
              onTap: _togglePlay,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              onTap: _togglePlay2,
            ),
          ],
        ),
      ),
    );
  }
}
