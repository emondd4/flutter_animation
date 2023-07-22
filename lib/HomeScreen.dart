import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animation/HeroAnimationScreen.dart';
import 'package:flutter_animation/HoverAnimationScreen.dart';
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

  final List<double> _paddingList = [6.0,6.0,6.0,6.0,6.0,6.0];
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
            customButton("Twin Animation", const TwinAnimationPage(),0),
            const SizedBox(height: 10.0,),
            customButton("Animated Container", const AnimatedContainerPage(),1),
            const SizedBox(height: 10.0,),
            customButton("Opacity Animation", const OpacityAnimationPage(),2),
            const SizedBox(height: 10.0,),
            customButton("Hero Animation", const HeroAnimationPage(),3),
            const SizedBox(height: 10.0,),
            customButton("Ripple Animation", const RippleAnimationPage(),4),
            const SizedBox(height: 10.0,),
            customButton("Hover Animation", const HoverAnimationPage(),5),
          ],
        ),
      ),
    );
  }

  Widget customButton(String title, Widget pageRoute,int position){
    return GestureDetector(
      onTap: () {
        Timer(const Duration(milliseconds: 1000), () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => pageRoute));
        });
      },
      onTapDown: (_) => setState(() {
        _paddingList[position] = 0.0;
      }),
      onTapUp: (_) => setState(() {
        _paddingList[position] = 6.0;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.only(bottom: _paddingList[position],right: _paddingList[position]),
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
