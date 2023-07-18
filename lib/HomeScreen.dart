import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animation/TwinAnimationScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _padding = 6.0;

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
            GestureDetector(
              onTap: () {
                Timer(const Duration(milliseconds: 1000), () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const TwinAnimationPage()));
                });
              },
              onTapUp: (_) {
                setState(() {
                  _padding = 6.0;
                });
              },
              onTapDown: (_) {
                setState(() {
                  _padding = 0.0;
                });
              },
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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: Text("Twin Animation",
                          style: TextStyle(color: Colors.black, fontSize: 18.0)),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isRedundentClick(DateTime currentTime) {
    if (loginClickTime == null) {
      loginClickTime = currentTime;
      print("first click");
      return false;
    }
    print('diff is ${currentTime.difference(loginClickTime).inSeconds}');
    if (currentTime.difference(loginClickTime).inSeconds < 10) {
      // set this difference time in seconds
      return true;
    }

    loginClickTime = currentTime;
    return false;
  }

}
