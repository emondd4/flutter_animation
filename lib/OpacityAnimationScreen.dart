import 'package:flutter/material.dart';

class OpacityAnimationPage extends StatefulWidget {
  const OpacityAnimationPage({Key? key}) : super(key: key);

  @override
  State<OpacityAnimationPage> createState() => _OpacityAnimationPageState();
}

class _OpacityAnimationPageState extends State<OpacityAnimationPage> {

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.android,
          color: Colors.white,
        ),
        title: const Text(
          "Opacity Animation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
