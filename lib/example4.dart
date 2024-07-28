import 'package:flutter/material.dart';

class Example4 extends StatefulWidget {
  const Example4({super.key});

  @override
  State<Example4> createState() => _Example4State();
}

class _Example4State extends State<Example4> {

  bool _isZoomedIn = false;
  String _buttonTitle = 'Zoom In';
  double _width = 100;
  Curve _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _width,
              height: _width,
              color: Colors.red,
              duration: const Duration(milliseconds: 300),
              curve: _curve,
              child: const FlutterLogo(),
            ),
            TextButton(onPressed: (){
              setState(() {
                _isZoomedIn = !_isZoomedIn;
                _width = _isZoomedIn ? 50 : 100;
                _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
                _buttonTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
              });
            }, child: Text(_buttonTitle))
          ],
        ),
      ),
    );
  }
}
