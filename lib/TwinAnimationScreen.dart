import 'package:flutter/material.dart';

class TwinAnimationPage extends StatefulWidget {
  const TwinAnimationPage({Key? key}) : super(key: key);

  @override
  State<TwinAnimationPage> createState() => _TwinAnimationPageState();
}

class _TwinAnimationPageState extends State<TwinAnimationPage> {
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
        child: Center(

        ),
      ),
    );
  }
}
