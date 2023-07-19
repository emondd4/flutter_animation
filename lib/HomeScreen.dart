import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animation/HeroAnimationScreen.dart';
import 'package:flutter_animation/OpacityAnimationScreen.dart';
import 'package:flutter_animation/RippleAnimationScreen.dart';
import 'package:flutter_animation/TwinAnimationScreen.dart';

import 'AnimatedContainerScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _padding = 6.0;
  late DateTime buttonClickTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.android,
          color: Colors.white,
        ),
        title: const Text(
          "Flutter Animation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customButton("Twin Animation", const TwinAnimationPage()),
            const SizedBox(height: 10.0,),
            customButton("Animated Container", const AnimatedContainerPage()),
            const SizedBox(height: 10.0,),
            customButton("Opacity Animation", const OpacityAnimationPage()),
            const SizedBox(height: 10.0,),
            customButton("Hero Animation", const HeroAnimationPage()),
            const SizedBox(height: 10.0,),
            customButton("Ripple Animation", const RippleAnimationPage()),
          ],
        ),
      ),
    );
  }

  Widget customButton(String title, Widget pageRoute){
    return GestureDetector(
      onTap: () {
        Timer(const Duration(milliseconds: 1000), () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => pageRoute));
        });
      },
      onTapDown: (_) => setState(() {
        _padding = 0.0;
      }),
      onTapUp: (_) => setState(() {
        _padding = 6.0;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.only(bottom: _padding,right: _padding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white70
        ),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(title,
                  style: const TextStyle(color: Colors.black, fontSize: 18.0)),
            )),
      ),
    );
  }

}
