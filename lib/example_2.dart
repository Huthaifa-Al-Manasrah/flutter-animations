import 'dart:math';

import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> with TickerProviderStateMixin{

  late AnimationController _counterClockWiseRotationController;
  late Animation<double> _counterClockWiseRotationAnimation;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _counterClockWiseRotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );

    _counterClockWiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2)
    ).animate(
      CurvedAnimation(parent: _counterClockWiseRotationController, curve: Curves.bounceOut)
    );

    _flipController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    );

    _flipAnimation = Tween<double>(
      begin: 0,
      end: pi
    ).animate(
        CurvedAnimation(parent: _flipController, curve: Curves.bounceOut)
    );

    _counterClockWiseRotationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _flipAnimation = Tween<double>(
            begin: _flipAnimation.value,
            end: _flipAnimation.value + pi
        ).animate(
            CurvedAnimation(parent: _flipController, curve: Curves.bounceOut)
        );

        _flipController..reset()..forward();
      }
    });

    _flipController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _counterClockWiseRotationAnimation = Tween<double>(
            begin: _counterClockWiseRotationAnimation.value,
            end: _counterClockWiseRotationAnimation.value + -(pi / 2)
        ).animate(
            CurvedAnimation(parent: _counterClockWiseRotationController, curve: Curves.bounceOut)
        );
        _counterClockWiseRotationController..reset()..forward();
      }
    });
  }

  @override
  void dispose() {
    _counterClockWiseRotationController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () {
      _counterClockWiseRotationController..reset()..forward();
    });

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _counterClockWiseRotationAnimation,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()..rotateZ(_counterClockWiseRotationAnimation.value),
              alignment: Alignment.center,
              child: AnimatedBuilder(
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const ShapeDecoration(
                        shape: CircleBorder()
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.amber,
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  );
                }, animation: _flipAnimation,
              ),
            );
          }
        ),
      ),
    );
  }
}
