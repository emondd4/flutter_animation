import 'package:flutter/material.dart';

class TwinAnimationPage extends StatefulWidget {
  const TwinAnimationPage({Key? key}) : super(key: key);

  @override
  State<TwinAnimationPage> createState() => _TwinAnimationPageState();
}

class _TwinAnimationPageState extends State<TwinAnimationPage> with SingleTickerProviderStateMixin {

  late Animation animation;
  late Animation colorAnimation;
  late AnimationController animationController;

  double height = 64;
  double width = 64;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 4));
    animation = Tween(begin:0.0 ,end: 1024.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.deepOrangeAccent,end: Colors.orange).animate(animationController);

    animationController.addListener(() {
      setState(() {
        height = animation.value;
        width = animation.value;
      });
    });

    animationController.forward();

    super.initState();
  }

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
      body: Center(
        child: Container(
          height: animation.value,
          width: animation.value,
            decoration: BoxDecoration(
              color: colorAnimation.value
            ),
          child: const Center(
            child: Icon(Icons.android,color: Colors.white,size: 48.0,),
          ),
        ),
      ),
    );
  }
}
