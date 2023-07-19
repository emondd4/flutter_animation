import 'package:flutter/material.dart';
import 'package:flutter_animation/HeroAnimationScreenTwo.dart';

class HeroAnimationPage extends StatefulWidget {
  const HeroAnimationPage({super.key});

  @override
  State<HeroAnimationPage> createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.android,
          color: Colors.white,
        ),
        title: const Text(
          "Hero Animation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HeroAnimationPageTwo()));
          },
            child: Hero(
                tag: "goku",
                child: Image.asset(
                  "assets/images/goku.png",
                  height: 128.0,
                  width: 128.0,
                ))),
      ),
    );
  }
}
