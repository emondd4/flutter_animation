import 'package:flutter/material.dart';

class RippleAnimationPage extends StatefulWidget {
  const RippleAnimationPage({Key? key}) : super(key: key);

  @override
  State<RippleAnimationPage> createState() => _RippleAnimationPageState();
}

class _RippleAnimationPageState extends State<RippleAnimationPage> with SingleTickerProviderStateMixin {

  late Animation animation;
  late AnimationController animationController;

  var listRadius = [150.0,200.0,250.0,300.0,350.0];

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 5), lowerBound: 0.5);
    //animation = Tween(begin: 0.0,end: 1.0).animate(animationController);

    animationController.addListener(() {
        setState(() {

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
          "Ripple Animation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: listRadius.map((radius) => Container(
            width: radius * animationController.value,
            height: radius * animationController.value,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.withOpacity(1.0 - animationController.value)
            ),
            child: const Icon(Icons.call,color: Colors.white,),
          )).toList(),
        ),
      ),
    );
  }
}
