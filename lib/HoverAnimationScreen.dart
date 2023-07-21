import 'package:flutter/material.dart';

class HoverAnimationPage extends StatefulWidget {
  const HoverAnimationPage({Key? key}) : super(key: key);

  @override
  State<HoverAnimationPage> createState() => _HoverAnimationPageState();
}

class _HoverAnimationPageState extends State<HoverAnimationPage> with SingleTickerProviderStateMixin {
  
  late Animation<Offset> animation;
  late AnimationController animationController;
  
  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 3))..repeat(reverse: true);
    animation = Tween(begin: Offset.zero,end: Offset(0, 0.08)).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

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
          "Hover Animation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: SizedBox(
          height: 250.0,
          width: 250.0,
          child: Stack(
            children: [
              Positioned(left: 0,top: 0,child: Image.asset("assets/images/cloud.png",height: 64.0,width: 64.0,),),
              Positioned(left: 0,top: 0,bottom: 0,right: 0,child: SlideTransition(position:animation,child: Image.asset("assets/images/plane.png",height: 64.0,width: 64.0,)),),
              Positioned(right: 0,bottom: 0,child: Image.asset("assets/images/cloud.png",height: 64.0,width: 64.0,),)
            ],
          ),
        ),
      ),
    );
  }
}
