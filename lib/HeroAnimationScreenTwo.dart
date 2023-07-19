import 'package:flutter/material.dart';

class HeroAnimationPageTwo extends StatefulWidget {
  const HeroAnimationPageTwo({super.key});

  @override
  State<HeroAnimationPageTwo> createState() => _HeroAnimationPageTwoState();
}

class _HeroAnimationPageTwoState extends State<HeroAnimationPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.android,
          color: Colors.white,
        ),
        title: const Text(
          "Hero Animation Two",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Hero(tag:"goku",child: Image.asset("assets/images/goku.png",height: 512.0,width: 512.0,)),
      ),

    );
  }
}
