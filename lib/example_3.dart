import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();
    _xController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));

    _yController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));

    _zController =
        AnimationController(vsync: this, duration: const Duration(seconds: 40));

    _animation = Tween<double>(begin: 0, end: pi * 2);
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();
    _yController
      ..reset()
      ..repeat();
    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Center(
              child: AnimatedBuilder(
                  animation: Listenable.merge(
                      [_xController, _yController, _zController]),
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateX(_animation.evaluate(_xController))
                        ..rotateY(_animation.evaluate(_yController))
                        ..rotateZ(_animation.evaluate(_zController)),
                      child: Stack(
                        children: [
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..translate(
                                vector.Vector3(0, 0, -100)
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.amber,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.red,
                          ),

                          Transform(
                            alignment: Alignment.centerLeft,
                            transform: Matrix4.identity()..rotateY(pi / 2),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.blue,
                            ),
                          ),

                          Transform(
                            alignment: Alignment.centerRight,
                            transform: Matrix4.identity()..rotateY(-pi / 2),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey,
                            ),
                          ),

                          Transform(
                            alignment: Alignment.topCenter,
                            transform: Matrix4.identity()..rotateX(-pi / 2),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.deepPurple,
                            ),
                          ),

                          Transform(
                            alignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()..rotateX(pi / 2),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
