import 'package:flutter/material.dart';

class Hub extends StatelessWidget {
  const Hub({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("This is my Hub Screen",style: TextStyle(
            fontSize: 20
          ),),
        ),
      ),
    );
  }
}
