import 'package:flutter/material.dart';

class Learn extends StatelessWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context) {
    return const  SafeArea(
      child: Scaffold(
        body: Center(
            child: Text("This is my Learn Screen",style: TextStyle(
              fontSize: 20
            ),),),
      ),
    );
  }
}
