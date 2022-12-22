import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SimpleAnimation extends StatefulWidget {
  const SimpleAnimation({Key? key}) : super(key: key);

  @override
  State<SimpleAnimation> createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
   Artboard? _riveArtboard;
  void initState(){
    super.initState();
    rootBundle.load('assets/vehicles.riv').then(
      (data) async {
        final file = RiveFile.import(data);
         final artboard = file.mainArtboard;
          setState(() => _riveArtboard = artboard);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Simple Animation')),
      body: Container(
        child: Rive(artboard: _riveArtboard!,)
      ),
    );
  }
}